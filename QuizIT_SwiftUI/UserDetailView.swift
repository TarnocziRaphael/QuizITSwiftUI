//
//  UserDetailView.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 18.11.23.
//

import SwiftUI

struct UserDetailView: View {
    @StateObject var uModel = UserModel(userlist: [User(user_name: "rtarnoczi", user_year: 4)])
    var body: some View {
        VStack {
            List(uModel.userlist) {
                user in UserView(user: user)
            }
            .listStyle(.sidebar)
            Spacer()
            Button("User aus Datenbank laden") {
                uModel.loadData()
            }
            .buttonStyle(.bordered)
            .padding(.top, 10)
            Button("User zurücksetzen") {
                uModel.resetData()
            }
            .buttonStyle(.bordered)
            .padding(.top, 10)
        }
    }
}

#Preview {
    UserDetailView()
}
