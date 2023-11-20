//
//  SubjectView.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 18.11.23.
//

import SwiftUI

struct SubjectView: View {
    @State var subject: Subject
    var body: some View {
        HStack {
            Image(systemName: getPicture(sName: subject.subject_name))
                .imageScale(.large)
                .foregroundColor(.blue)
                .padding(.leading, 20)
            Spacer()
            Text(subject.subject_name)
                .font(.title2)
                .padding(.trailing, 20)
        }
    }
}

#Preview {
    SubjectView(subject: Subject(subject_name: "SEW"))
}
func getPicture(sName name: String) -> String {
    if name == "GGP" {
        return "globe"
    }
    else if name == "AM" {
        return "plusminus"
    }
    else if name == "SEW" {
        return "desktopcomputer"
    }
    else {
        return "exclamationmark.triangle"
    }
}
