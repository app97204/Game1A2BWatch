//
//  ContentView.swift
//  game1a2b Watch App
//
//  Created by Cheng Yan Yang on 2023/7/10.
//

import SwiftUI

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 15) {
                    NavigationLink {
                        GameView()
                    } label: {
                        HStack(spacing: 20.0){
                            Image(systemName: "gamecontroller.fill")
                            Text("Game")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    NavigationLink {
                        GuideView()
                    } label: {
                        HStack(spacing: 20.0){
                            Image(systemName: "questionmark.circle.fill")
                            Text("Tutorial")
                        }
                    }
                }
            }.navigationTitle("1A2B")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.locale, .init(identifier: "zh-Hant"))
            .environment(\.locale, .init(identifier: "en"))
    }
}
