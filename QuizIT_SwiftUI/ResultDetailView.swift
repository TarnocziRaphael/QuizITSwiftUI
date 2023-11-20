//
//  ResultDetailView.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 19.11.23.
//

import SwiftUI

struct ResultDetailView: View {
    @StateObject var rModel = ResultModel(resultlist: [Result(result_value: 500, user_name: "rtarnoczi", subject_name: "GGP", focus_name: "2Weltkrieg")])
    @State var textInput1: String = ""
    @State var textInput2: String = ""
    var body: some View {
        VStack {
            List(rModel.resultlist) {
                result in ResultView(result: result)
            }
            .listStyle(.sidebar)
            Spacer()
            TextField("Username",text: $textInput1)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .padding(.horizontal, 20)
            TextField("Schwerpunkt",text: $textInput2)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .padding(.horizontal, 20)
            Button("Ergebnisse aus Datenbank laden") {
                rModel.loadData(uName: textInput1, uFocus: textInput2)
                textInput1 = ""
                textInput2 = ""
            }
            .buttonStyle(.bordered)
            .padding(.top, 10)
            Button("Ergebnisse zurücksetzen") {
                rModel.resetData()
            }
            .buttonStyle(.bordered)
            .padding(.top, 10)
        }
    }
}

#Preview {
    ResultDetailView()
}
