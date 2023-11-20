//
//  FocusDetailView.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 18.11.23.
//

import SwiftUI

struct FocusDetailView: View {
    @StateObject var fModel = FocusModel(focuslist: [Focus(focus_name: "2Weltkrieg", focus_year: 4, subject_name: "GGP")])
    @State var text: String = ""
    var body: some View {
        VStack {
            List(fModel.focuslist) {
                focus in FocusView(focus: focus)
            }
            .listStyle(.sidebar)
            Spacer()
            TextField("Fach", text: $text)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .padding(.horizontal, 20)
            Button("Schwerpunkte aus Datenbank laden") {
                fModel.loadData(uInput: text)
                self.text = ""
            }
            .buttonStyle(.bordered)
            .padding(.top, 10)
            Button("Schwerpunkte zurücksetzen") {
                fModel.resetData()
            }
            .buttonStyle(.bordered)
            .padding(.top, 10)
        }
    }
}

#Preview {
    FocusDetailView()
}
