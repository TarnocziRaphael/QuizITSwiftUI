//
//  FocusModel.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 18.11.23.
//

import Foundation
struct Focus: Identifiable, Decodable {
    let id = UUID()
    let focus_name: String
    let focus_year: Int
    let subject_name: String
}
class FocusModel: ObservableObject {
    @Published var focuslist: [Focus]
    init(focuslist: [Focus]) {
        self.focuslist = focuslist
    }
    func loadData(uInput subject: String) {
        guard let url = URL(string: "http://localhost:3000/getFocus/\(subject)") else {
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
                    self.focuslist = []
                }
                let decodedFocus = try JSONDecoder().decode([Focus].self, from: responseData)
                DispatchQueue.main.async {
                    decodedFocus.forEach { focus in
                        self.focuslist.append(focus)
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
        self.focuslist = [Focus(focus_name: "2Weltkrieg", focus_year: 4, subject_name: "GGP")]
    }
}
