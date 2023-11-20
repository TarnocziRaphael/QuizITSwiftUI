//
//  ResultModel.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 19.11.23.
//

import Foundation
struct Result: Identifiable, Decodable {
    let id = UUID()
    let result_value: Int
    let user_name: String
    let subject_name: String
    let focus_name: String
}
class ResultModel: ObservableObject {
    @Published var resultlist: [Result]
    init(resultlist: [Result]) {
        self.resultlist = resultlist
    }
    func loadData(uName name: String, uFocus focus: String) {
        guard let url = URL(string: "http://localhost:3000/getResult/\(name)/\(focus)") else {
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
                    self.resultlist = []
                }
                let decodedResult = try JSONDecoder().decode([Result].self, from: responseData)
                DispatchQueue.main.async {
                    decodedResult.forEach {
                        result in self.resultlist.append(result)
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
        self.resultlist = [Result(result_value: 500, user_name: "rtarnoczi", subject_name: "GGP", focus_name: "2Weltkrieg")]
        
    }
}
