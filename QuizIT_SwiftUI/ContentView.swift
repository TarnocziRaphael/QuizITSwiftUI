//
//  ContentView.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 18.11.23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(getImageText(color: colorScheme))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                }
                NavigationLink(destination: UserDetailView()) {
                    HStack {
                        Image(systemName: "person")
                            .imageScale(.large)
                            .foregroundColor(getTextColor(color: colorScheme))
                        Text("User anzeigen")
                            .foregroundStyle(getTextColor(color: colorScheme))
                            .font(.title2)
                    }
                    .padding(.vertical)
                }
                NavigationLink(destination: SubjectDetailView()) {
                    HStack {
                        Image(systemName: "folder")
                            .imageScale(.large)
                            .foregroundColor(getTextColor(color: colorScheme))
                        Text("Fächer anzeigen")
                            .foregroundStyle(getTextColor(color: colorScheme))
                            .font(.title2)
                    }
                    .padding(.vertical)
                }
                NavigationLink(destination: FocusDetailView()) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .foregroundColor(getTextColor(color: colorScheme))
                        Text("Schwerpunkte anzeigen")
                            .foregroundStyle(getTextColor(color: colorScheme))
                            .font(.title2)
                    }
                    .padding(.vertical)
                }
                NavigationLink(destination: QuestionDetailView()) {
                    HStack {
                        Image(systemName: "questionmark.square")
                            .imageScale(.large)
                            .foregroundColor(getTextColor(color: colorScheme))
                        Text("Fragen anzeigen")
                            .foregroundStyle(getTextColor(color: colorScheme))
                            .font(.title2)
                    }
                    .padding(.vertical)
                }
                
                NavigationLink(destination: ResultDetailView()) {
                    HStack {
                        Image(systemName: "exclamationmark.bubble")
                            .imageScale(.large)
                            .foregroundColor(getTextColor(color: colorScheme))
                        Text("Resultate anzeigen")
                            .foregroundStyle(getTextColor(color: colorScheme))
                            .font(.title2)
                    }
                    .padding(.vertical)
                }
                NavigationLink(destination: QuizDetailView()) {
                    HStack {
                        Image(systemName: "person.crop.circle.badge.questionmark")
                            .imageScale(.large)
                            .foregroundColor(getTextColor(color: colorScheme))
                        Text("Quiz starten")
                            .foregroundStyle(getTextColor(color: colorScheme))
                            .font(.title2)
                    }
                    .padding(.vertical)
                }
                Spacer()
            }
        }
    }
}
func getTextColor(color c: ColorScheme) -> Color{
    if c == .dark {
        return .white
    }
    else {
        return .black
    }
}
func getImageText(color c: ColorScheme) -> String{
    if c == .dark {
        return "LogoDark"
    }
    else {
        return "LogoWhite"
    }
}

#Preview {
    ContentView()
}
