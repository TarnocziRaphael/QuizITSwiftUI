//
//  QuizDetailView.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 21.11.23.
//

import SwiftUI

struct QuizDetailView: View {
    @ObservedObject var quizModel: Quiz = Quiz(quizQuestionList: [])
    @Environment(\.colorScheme) var colorScheme
    @State var quizStarted: Bool = false
    @State var questionCounter: Int = 0
    @State var focus: String = ""
    @State var username: String = ""
    var body: some View {
        VStack {
            Image(getImageText(color: colorScheme))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
            if quizStarted == false {
                VStack {
                    Spacer()
                    TextField("Focus", text: $focus)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    TextField("Username", text: $username)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    Button("Quiz starten") {
                        questionCounter += 1
                        let qM = QuestionModel(questionlist: [])
                        qM.loadData(uInput: focus)
                        quizModel.quizQuestionList = qM.questionlist.shuffled()
                        quizModel.printQuestions()
                        quizStarted = true
                    }
                    .buttonStyle(.bordered)
                }
            }
            else if questionCounter <= 5 && quizStarted == true{
                let currentQuestion: Question = quizModel.getQuestion(i: questionCounter)
                VStack {
                    Spacer()
                    let questionView = QuizQuestionView(question: currentQuestion)
                    questionView
                    Spacer()
                    Button(getText()) {
                        let pCorrect: Double = getPointsPerCorrectAnswer(question: currentQuestion)
                        let pFalse: Double = getPointsPerWrongAnswer(question: currentQuestion)
                        var points: Double = 0.0
                        if questionView.answer1Active == true && currentQuestion.question_correctAnswer1 == 1 {
                            points += pCorrect
                        }
                        else if (questionView.answer1Active == true && currentQuestion.question_correctAnswer1 == 0) || (questionView.answer1Active == false && currentQuestion.question_correctAnswer1 == 1) {
                            points -= pFalse
                        }
                        if questionView.answer2Active == true && currentQuestion.question_correctAnswer2 == 1 {
                            points += pCorrect
                        }
                        else if (questionView.answer2Active == true && currentQuestion.question_correctAnswer2 == 0) || (questionView.answer2Active == false && currentQuestion.question_correctAnswer2 == 1) {
                            points -= pFalse
                        }
                        if questionView.answer3Active == true && currentQuestion.question_correctAnswer3 == 1 {
                            points += pCorrect
                        }
                        else if (questionView.answer3Active == true && currentQuestion.question_correctAnswer3 == 0) || (questionView.answer3Active == false && currentQuestion.question_correctAnswer3 == 1) {
                            points -= pFalse
                        }
                        if questionView.answer4Active == true && currentQuestion.question_correctAnswer4 == 1 {
                            points += pCorrect
                        }
                        else if (questionView.answer4Active == true && currentQuestion.question_correctAnswer4 == 0) || (questionView.answer4Active == false && currentQuestion.question_correctAnswer4 == 1) {
                            points -= pFalse
                        }
                        if points < 0 {
                            points = 0
                        }
                        quizModel.result += points
                        questionCounter += 1
                    }
                    .buttonStyle(.bordered)
                }
                .padding(.bottom, 10)
            }
            else {
                NavigationView {
                    VStack {
                        Text("Erreichte Punkte \(String(quizModel.result))")
                            .font(.title2)
                    }
                }
                
            }
        }
    }
    func getPointsPerCorrectAnswer(question q: Question) -> Double {
        var counter: Double = 0.0
        if q.question_correctAnswer1 == 1 {
            counter += 1.0
        }
        if q.question_correctAnswer2 == 1 {
            counter += 1.0
        }
        if q.question_correctAnswer3 == 1 {
            counter += 1.0
        }
        if q.question_correctAnswer4 == 1 {
            counter += 1.0
        }
        return 1.0/counter;
    }
    func getPointsPerWrongAnswer(question q: Question) -> Double {
        var counter: Double = 0.0
        if q.question_correctAnswer1 == 0 {
            counter += 1.0
        }
        if q.question_correctAnswer2 == 0 {
            counter += 1.0
        }
        if q.question_correctAnswer3 == 0 {
            counter += 1.0
        }
        if q.question_correctAnswer4 == 0 {
            counter += 1.0
        }
        return 1.0/counter;
    }
    func getText() -> String {
        if questionCounter < 5 {
            return "Nächste Frage"
        }
        else {
            return "Quiz abgeben"
        }
    }
}

#Preview {
    QuizDetailView()
}
