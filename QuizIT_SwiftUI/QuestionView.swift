//
//  QuestionView.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 18.11.23.
//

import SwiftUI

struct QuestionView: View {
    @State var question: Question
    @Environment(\.colorScheme) var colorScheme
    @State var text: String = "Antworten anzeigen"
    var body: some View {
        VStack {
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
                    Text(question.question_answer1 ?? "")
                        .foregroundColor(getAnswerTextColor(color: colorScheme))
                    Spacer()
                    Text(getBoolean(pCorrect: question.question_correctAnswer1 ?? 0))
                        .padding(.trailing, 20)
                        .foregroundColor(showAnswers(currentColor: colorScheme))
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
                    Text(question.question_answer2 ?? "")
                        .foregroundColor(getAnswerTextColor(color: colorScheme))
                    Spacer()
                    Text(getBoolean(pCorrect: question.question_correctAnswer2 ?? 0))
                        .padding(.trailing, 20)
                        .foregroundColor(showAnswers(currentColor: colorScheme))
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
                    Text(question.question_answer3 ?? "")
                        .foregroundColor(getAnswerTextColor(color: colorScheme))
                    Spacer()
                    Text(getBoolean(pCorrect: question.question_correctAnswer3 ?? -1))
                        .padding(.trailing, 20)
                        .foregroundColor(showAnswers(currentColor: colorScheme))
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
                    Text(getBoolean(pCorrect: question.question_correctAnswer4 ?? -1))
                        .padding(.trailing, 20)
                        .foregroundColor(showAnswers(currentColor: colorScheme))
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2)
                )
                .padding(.horizontal,20)   
            }
            Button(text) {
                if text == "Antworten anzeigen" {
                    text = "Antworten verbergen"
                }
                else if text == "Antworten verbergen" {
                    text = "Antworten anzeigen"
                }
                else {
                    text = "Antworten anzeigen"
                }
            }
            .buttonStyle(.bordered)
            .padding(.top, 5)
        }
    }
    func showAnswers(currentColor c: ColorScheme) -> Color{
        if text == "Antworten anzeigen" && c == .dark{
            return .black
        }
        else if text == "Antworten anzeigen" && c == .light {
            return .white
        }
        else if text == "Antworten verbergen" && c == .dark{
            return .white
        }
        else if text == "Antworten verbergen" && c == .light {
            return .black
        }
        else {
            return .blue
        }
            
    }
}
func getBoolean(pCorrect s: Int) -> String {
    if s == 1 {
        return "Wahr"
    }
    else if s == 0{
        return "Falsch"
    }
    else {
        return ""
    }
}
func setVisibility(qText text: String) -> Bool {
    if text != "" {
        return false
    }
    else {
        return true
    }
}
func getAnswerTextColor(color c: ColorScheme) -> Color {
    if c == .dark {
        return .white
    }
    else {
        return .black
    }
    
}
func getAnswerText(color c: ColorScheme) -> Color {
    if c == .dark {
        return .black
    }
    else {
        return .white
    }
}

#Preview {
    QuestionView(question: Question(question_text: "Wer war der Führer Deutschlands während des Zweiten Weltkriegs?", question_answer1: "Winston Churchill", question_answer2: "Josef Stalin", question_answer3: "Adolf Hitler", question_answer4: "Benito Mussolini", question_correctAnswer1: 0, question_correctAnswer2: 0, question_correctAnswer3: 1, question_correctAnswer4: 0))
}
