//
//  QuizQuestionView.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 21.11.23.
//

import SwiftUI

struct QuizQuestionView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var question: Question
    @State var answer1Active: Bool = false
    @State var answer2Active: Bool = false
    @State var answer3Active: Bool = false
    @State var answer4Active: Bool = false
    var body: some View {
        HStack {
            Image(systemName: "questionmark.square")
                .imageScale(.large)
                .foregroundColor(.blue)
            Text(question.question_text)
                .font(.title2)
        }
        Spacer()
            .frame(height: 20)
        if setVisibility(qText: question.question_answer1 ?? "") {
            EmptyView()
        }
        else {
            HStack {
                Image(systemName: "checkmark.seal")
                    .imageScale(.large)
                    .padding(5)
                    .foregroundColor(getAnswerTextColor(color: colorScheme))
                Button(question.question_answer1 ?? "") {
                    if answer1Active == false {
                        answer1Active = true
                    }
                    else {
                        answer1Active = false
                    }
                }
                    .foregroundColor(getAnswerTextColor(color: colorScheme))
                Spacer()
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 2)
            )
            .padding(.horizontal,20)
        }
        if setVisibility(qText: question.question_answer2 ?? "") {
            EmptyView()
        }
        else {
            HStack {
                Image(systemName: "checkmark.seal")
                    .imageScale(.large)
                    .padding(5)
                    .foregroundColor(getAnswerTextColor(color: colorScheme))
                Button(question.question_answer2 ?? "") {
                    if answer2Active == false {
                        answer2Active = true
                    }
                    else {
                        answer2Active = false
                    }
                }
                    .foregroundColor(getAnswerTextColor(color: colorScheme))
                Spacer()
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 2)
            )
            .padding(.horizontal,20)
        }
        if setVisibility(qText: question.question_answer3 ?? "") {
            EmptyView()
        }
        else {
            HStack {
                Image(systemName: "checkmark.seal")
                    .imageScale(.large)
                    .padding(5)
                    .foregroundColor(getAnswerTextColor(color: colorScheme))
                Button(question.question_answer3 ?? "") {
                    if answer3Active == false {
                        answer3Active = true
                    }
                    else {
                        answer3Active = false
                    }
                }
                    .foregroundColor(getAnswerTextColor(color: colorScheme))
                Spacer()
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 2)
            )
            .padding(.horizontal,20)
        }
        if setVisibility(qText: question.question_answer4 ?? "") {
            EmptyView()
        }
        else {
            HStack {
                Image(systemName: "checkmark.seal")
                    .imageScale(.large)
                    .padding(5)
                    .foregroundColor(getAnswerTextColor(color: colorScheme))
                Text(question.question_answer4 ?? "")
                    .foregroundColor(getAnswerTextColor(color: colorScheme))
                Spacer()
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 2)
            )
            .padding(.horizontal,20)
        }
    }
}

#Preview {
    QuizQuestionView(question: Question(question_text: "Wer war der Führer Deutschlands während des Zweiten Weltkriegs?", question_answer1: "Winston Churchill", question_answer2: "Josef Stalin", question_answer3: "Adolf Hitler", question_answer4: "Benito Mussolini", question_correctAnswer1: 0, question_correctAnswer2: 0, question_correctAnswer3: 1, question_correctAnswer4: 0))
}
