//
//  UserView.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 18.11.23.
//

import SwiftUI

struct UserView: View {
    @State var user: User
    var body: some View {
        HStack {
            Image(systemName: "graduationcap")
                .imageScale(.large)
                .foregroundColor(.blue)
                .padding(.leading, 20)
            Spacer()
            Text(user.user_name)
                .font(.title2)
            Spacer()
            Text(String(user.user_year))
                .font(.title)
                .padding(.trailing, 20)
                .foregroundColor(getColor(uYear: user.user_year))
        }
    }
}

#Preview {
    UserView(user: User(user_name: "rtarnoczi", user_year: 4))
}
func getColor(uYear year: Int) -> Color {
    if year == 5 {
        return .blue
    }
    else if year == 4 {
        return .red
    }
    else if year == 3{
        return .orange
    }
    else if year == 2 {
        return .yellow
    }
    else if year == 1 {
        return .green
    }
    else {
        return .black
    }
}
