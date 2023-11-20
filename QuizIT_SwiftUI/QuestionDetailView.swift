//
//  QuestionDetailView.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 18.11.23.
//

import SwiftUI

struct QuestionDetailView: View {
    @StateObject var qModel = QuestionModel(questionlist: [Question(question_text: "Wer war der Führer Deutschlands während des Zweiten Weltkriegs?", question_answer1: "Winston Churchill", question_answer2: "Josef Stalin", question_answer3: "Adolf Hitler", question_answer4: "Benito Mussolini", question_correctAnswer1: 0, question_correctAnswer2: 0, question_correctAnswer3: 1, question_correctAnswer4: 0)])
    @State var text: String = ""
    var body: some View {
        List(qModel.questionlist) {
            question in QuestionView(question: question)
        }
        .listStyle(.plain)
        Spacer()
        TextField("Schwerpunkt", text: $text)
            .textFieldStyle(.roundedBorder)
            .autocapitalization(.none)
            .padding(.horizontal, 20)
            .padding(.top,10)
        Button("Fragen aus Datenbank laden") {
            qModel.loadData(uInput: text)
            self.text = ""
        }
        .buttonStyle(.bordered)
        .padding(.top, 10)
        Button("Fragen zurücksetzen") {
            qModel.resetData()
        }
        .buttonStyle(.bordered)
        .padding(.top, 10)
    }
}

#Preview {
    QuestionDetailView()
}
