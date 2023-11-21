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
                        quizStarted = true
                        questionCounter += 1
                        let qM = QuestionModel(questionlist: [])
                        qM.loadData(uInput: focus)
                        quizModel.quizQuestionList = qM.questionlist.shuffled()
                    }
                    .buttonStyle(.bordered)
                    Spacer()
                }
            }
            else if questionCounter < 5 {
                let currentQuestion: Question
                do {
                    currentQuestion = quizModel.getQuestion(i: questionCounter)
                }
                catch {
                    currentQuestion = Question(question_text: "", question_answer1: "", question_answer2: "", question_answer3: "", question_answer4: "", question_correctAnswer1: "", question_correctAnswer2: "", question_correctAnswer3: "", question_correctAnswer4: "")
                }
                VStack {
                    Spacer()
                    let v = QuizQuestionView(question: currentQuestion)
                    Spacer()
                    Button("Nächte Frage") {
                        let pCorrect: Double = getPointsPerCorrectAnswer(question: currentQuestion)
                        let pFalse: Double = getPointsPerWrongAnswer(question: currentQuestion)
                        var points: Double = 0.0
                        if v.answer1Active == true && currentQuestion.question_correctAnswer1 == 1 {
                            points += pCorrect
                        }
                        else if (v.answer1Active == true && currentQuestion.question_correctAnswer1 == 0) || (v.answer1Active == false && currentQuestion.question_correctAnswer1 == 1) {
                            points -= pFalse
                        }
                        if v.answer2Active == true && currentQuestion.question_correctAnswer2 == 1 {
                            points += pCorrect
                        }
                        else if (v.answer2Active == true && currentQuestion.question_correctAnswer2 == 0) || (v.answer2Active == false && currentQuestion.question_correctAnswer2 == 1) {
                            points -= pFalse
                        }
                        if v.answer3Active == true && currentQuestion.question_correctAnswer3 == 1 {
                            points += pCorrect
                        }
                        else if (v.answer3Active == true && currentQuestion.question_correctAnswer3 == 0) || (v.answer3Active == false && currentQuestion.question_correctAnswer3 == 1) {
                            points -= pFalse
                        }
                        if v.answer4Active == true && currentQuestion.question_correctAnswer4 == 1 {
                            points += pCorrect
                        }
                        else if (v.answer4Active == true && currentQuestion.question_correctAnswer4 == 0) || (v.answer4Active == false && currentQuestion.question_correctAnswer4 == 1) {
                            points -= pFalse
                        }
                        quizModel.result += points
                        questionCounter += 1
                    }
                }
            }
            else {
                VStack {
                    Text("Erreichte Punkte \(String(quizModel.result))")
                        .font(.title2)
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
}

#Preview {
    QuizDetailView()
}
