//
//  QuizModel.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 21.11.23.
//

import Foundation
class Quiz: ObservableObject {
    @Published var quizQuestionList: [Question]
    var result: Double = 0.0
    init(quizQuestionList: [Question]) {
        self.quizQuestionList = quizQuestionList
    }
    func getQuestion(i: Int) -> Question{
        if i >= 0 && i < quizQuestionList.count {
            return quizQuestionList[i]
        }
        else {
            return Question(question_text: "In welchem Jahr begann der zweite Weltkrieg?", question_answer1: "1939", question_answer2: "1945", question_answer3: nil, question_answer4: nil, question_correctAnswer1: 1, question_correctAnswer2: 0, question_correctAnswer3: 0, question_correctAnswer4: 0)
        }
    }
    func toString() -> String{
        var s: String = ""
        var i: Int = 1
        quizQuestionList.forEach {
            quiz in 
            s = "Question\(i)"
            i += 1
        }
        return s
    }
    func printQuestions() {
        .alert
        print("reached here")
        print(toString())
    }
}
