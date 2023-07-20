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
    @AppStorage("score") private var bestScore:Int = -1
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 15) {
                    if(bestScore != -1){
                        HStack(spacing: 10){
                            Image(systemName: "trophy.fill")
                                .controlSize(.regular)
                            Text("Best: \n\(bestScore) times")
                                .frame(width: 100)
                                
                        }
                    }
                    NavigationLink {
                        GameView()
                    } label: {
                        HStack(spacing: 10){
                            Image(systemName: "gamecontroller.fill")
                            Text("Game")
                                .frame(width: 100)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    NavigationLink {
                        GuideView()
                    } label: {
                        HStack(spacing: 10){
                            Image(systemName: "questionmark.circle.fill")
                            Text("Tutorial")
                                .frame(width: 100)
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
