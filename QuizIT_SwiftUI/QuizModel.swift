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
    func getQuestion(i: Int) throws -> Question{
        if i >= 0 && i < quizQuestionList.count {
            throw fatalError()
        }
        else {
            return quizQuestionList[i]
        }
    }
}
