//
//  ResultView.swift
//  QuizIT_SwiftUI
//
//  Created by Raphael Tarnoczi on 19.11.23.
//

import SwiftUI

struct ResultView: View {
    @State var result: Result
    var body: some View {
        VStack {
            HStack {
                Image(systemName: getPicture(sName: "GGP"))
                    .imageScale(.large)
                    .foregroundColor(.blue)
                    .padding(.leading, 20)
                Text(result.subject_name)
                    .font(.title2)
                Spacer()
                Text(result.focus_name)
                    .padding(.trailing,20)
                    .font(.title2)
            }
            .padding(.bottom, 10)
            HStack {
                Text(result.user_name)
                    .padding(.leading, 20)
                    .font(.title2)
                Spacer()
                Text("\(String(result.result_value))/1000")
                    .padding(.trailing, 20)
                    .font(.title2)
                    .foregroundColor(getColor(res: result.result_value))
            }
        }
    }
}
func getColor(res value: Int) -> Color {
    if value == 1000 {
        return .purple
    }
    else if value >= 900 {
        return .blue
    }
    else if value >= 800 {
        return .green
    }
    else if value >= 700 {
        return .yellow
    }
    else if value >= 600 {
        return .orange
    }
    else if value >= 500 {
        return .pink
    }
    else {
        return .red
    }
}

#Preview {
    ResultView(result: Result(result_value: 500, user_name: "rtarnoczi", subject_name: "GGP", focus_name: "2Weltkrieg"))
}
