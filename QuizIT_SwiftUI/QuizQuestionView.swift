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
                    .foregroundColor(getTextColor(color: colorScheme, questionIndex: 1))
                Button(question.question_answer1 ?? "") {
                    if answer1Active == false {
                        answer1Active = true
                    }
                    else {
                        answer1Active = false
                    }
                }
                .foregroundColor(getTextColor(color: colorScheme, questionIndex: 1))
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
                    .foregroundColor(getTextColor(color: colorScheme, questionIndex: 2))
                Button(question.question_answer2 ?? "") {
                    if answer2Active == false {
                        answer2Active = true
                    }
                    else {
                        answer2Active = false
                    }
                }
                .foregroundColor(getTextColor(color: colorScheme, questionIndex: 2))
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
                    .foregroundColor(getTextColor(color: colorScheme, questionIndex: 3))
                Button(question.question_answer3 ?? "") {
                    if answer3Active == false {
                        answer3Active = true
                    }
                    else {
                        answer3Active = false
                    }
                }
                .foregroundColor(getTextColor(color: colorScheme, questionIndex: 3))
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
                    .foregroundColor(getTextColor(color: colorScheme, questionIndex: 4))
                Button(question.question_answer4 ?? "") {
                    if answer4Active == false {
                        answer4Active = true
                    }
                    else {
                        answer4Active = false
                    }
                }
                .foregroundColor(getTextColor(color: colorScheme, questionIndex: 4))
                Spacer()
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 2)
            )
            .padding(.horizontal,20)
        }
    }
    func getTextColor(color: ColorScheme, questionIndex: Int) -> Color{
        if (questionIndex == 1 && answer1Active == true) && (questionIndex == 2 && answer2Active == true) || (questionIndex == 3 && answer2Active == true) || (questionIndex == 4 && answer4Active == true){
            return .cyan
        }
        else {
            if color == .dark {
                return .white
            }
            else {
                return .black
            }
        }
        
    }
}
#Preview {
    QuizQuestionView(question: Question(question_text: "Wer war der Führer Deutschlands während des Zweiten Weltkriegs?", question_answer1: "Winston Churchill", question_answer2: "Josef Stalin", question_answer3: "Adolf Hitler", question_answer4: "Benito Mussolini", question_correctAnswer1: 0, question_correctAnswer2: 0, question_correctAnswer3: 1, question_correctAnswer4: 0))
}
