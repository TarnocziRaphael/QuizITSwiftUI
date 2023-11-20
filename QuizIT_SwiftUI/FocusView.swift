//
//  FocusView.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 18.11.23.
//

import SwiftUI

struct FocusView: View {
    @State var focus: Focus
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
                .foregroundColor(.blue)
                .padding(.leading,20)
            Spacer()
            Text(focus.focus_name)
                .font(.title2)
            Text(String(focus.focus_year))
                .foregroundStyle(getColor(uYear: focus.focus_year))
                .font(.title2)
            Spacer()
            Image(systemName: getPicture(sName: focus.subject_name))
                .imageScale(.large)
            Text(focus.subject_name)
                .padding(.trailing, 20)
        }
    }
}

#Preview {
    FocusView(focus: Focus(focus_name: "2Weltkrieg", focus_year: 4, subject_name: "GGP"))
}
