//
//  SubjectModel.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 18.11.23.
//

import Foundation
struct Subject: Identifiable, Decodable {
    let id = UUID()
    let subject_name: String
}
class SubjectModel: ObservableObject {
    @Published var subjectlist: [Subject]
    init(subjectlist: [Subject]) {
        self.subjectlist = subjectlist
    }
    func loadData(uInput name: String) {
        guard let url = URL(string: "http://localhost:3000/getSubjects/\(name)") else {
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
                    self.subjectlist = []
                }
                let decodedSubjects = try JSONDecoder().decode([Subject].self, from: responseData)
                DispatchQueue.main.async {
                    decodedSubjects.forEach { subject in
                        self.subjectlist.append(subject)
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
        self.subjectlist = [Subject(subject_name: "GGP")]
    }
}
