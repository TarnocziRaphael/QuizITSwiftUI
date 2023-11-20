//
//  SubjectDetailView.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 18.11.23.
//

import SwiftUI

struct SubjectDetailView: View {
    @StateObject var sModel = SubjectModel(subjectlist: [Subject(subject_name: "GGP")])
    @State var text: String = ""
    var body: some View {
        VStack {
            List(sModel.subjectlist) {
                subject in SubjectView(subject: subject)
            }
            .listStyle(.sidebar)
            Spacer()
            TextField("Username", text: $text)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .padding(.horizontal, 20)
            Button("Fächer aus Datenbank laden") {
                sModel.loadData(uInput: text)
                self.text = ""
            }
            .buttonStyle(.bordered)
            .padding(.top, 10)
            Button("Fächer zurücksetzen") {
                sModel.resetData()
            }
            .buttonStyle(.bordered)
            .padding(.top, 10)
        }
    }
}

#Preview {
    SubjectDetailView()
}
