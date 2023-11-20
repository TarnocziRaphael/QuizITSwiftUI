//
//  QuestionModel.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 18.11.23.
//

import Foundation
struct Question: Identifiable, Decodable {
    let id = UUID()
    let question_text: String
    let question_answer1: String?
    let question_answer2: String?
    let question_answer3: String?
    let question_answer4: String?
    let question_correctAnswer1: Int?
    let question_correctAnswer2: Int?
    let question_correctAnswer3: Int?
    let question_correctAnswer4: Int?
}
class QuestionModel: ObservableObject {
    @Published var questionlist: [Question]
    init(questionlist: [Question]) {
        self.questionlist = questionlist
    }
    func loadData(uInput focus: String) {
        guard let url = URL(string: "http://localhost:3000/getQuestion/\(focus)") else {
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
                    self.questionlist = []
                }
                let decodedQuestions = try JSONDecoder().decode([Question].self, from: responseData)
                DispatchQueue.main.async {
                    decodedQuestions.forEach {
                        question in self.questionlist.append(question)
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
        self.questionlist = [Question(question_text: "Wer war der Führer Deutschlands während des Zweiten Weltkriegs?", question_answer1: "Winston Churchill", question_answer2: "Josef Stalin", question_answer3: "Adolf Hitler", question_answer4: "Benito Mussolini", question_correctAnswer1: 0, question_correctAnswer2: 0, question_correctAnswer3: 1, question_correctAnswer4: 0)]
    }
}
