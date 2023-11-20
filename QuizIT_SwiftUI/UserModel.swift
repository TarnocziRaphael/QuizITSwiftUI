//
//  UserModel.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 18.11.23.
//

import Foundation
struct User: Identifiable, Decodable {
    let id = UUID()
    let user_name: String
    let user_year: Int
}
class UserModel: ObservableObject {
    @Published var userlist: [User]
    init(userlist: [User]) {
        self.userlist = userlist
    }
    func loadData() {
        guard let url = URL(string: "http://localhost:3000/getUser") else {
            print("URL ist ungültig")
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            data,response, error in
            guard error == nil else {
                print("URL konnte nicht geöffnet werden")
                return
            }
            guard let responseData = data else {
                print("Erhaltene Daten sind leer")
                return
            }
            guard let responseString = String(data: responseData, encoding: .utf8) else  {
                print("Erhaltene Daten entsprechen nicht UTF8")
                return
            }
            print(responseString)
            do {
                DispatchQueue.main.async {
                    self.userlist = []
                }
                let decodedUsers = try JSONDecoder().decode([User].self, from: responseData)
                DispatchQueue.main.async {
                    decodedUsers.forEach { user in
                        self.userlist.append(user)
                    }
                }
            }
            catch {
                print("Fehler bei der Umwandlung von JSON zu Objekt: \(error)")
            }
        }
        task.resume()
        return
    }
    func resetData() {
        self.userlist = [User(user_name: "rtarnoczi", user_year: 4)]
    }
}
