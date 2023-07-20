//
//  GameView.swift
//  game1a2b Watch App
//
//  Created by Cheng Yan Yang on 2023/7/18.
//

import SwiftUI
import SwiftUI_Apple_Watch_Decimal_Pad

func getAns() -> String{
    var nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    nums.shuffle()
    return  "\(nums[0])\(nums[1])\(nums[2])\(nums[3])"
}

func check(nums:String)->Bool{
    if nums.count != 4 {
        return false
    }
    for c1 in 0..<3{
        for c2 in c1+1..<4{
            if nums[c1] ==  nums[c2]{
                return false
            }
        }
    }
    return true
}

struct Guess{
    public var id:Int;
    public var num:String;
    public var a:Int;
    public var b:Int;
}

struct GameView: View {
    @State private var ans = getAns()
    @State private var guessNum = ""
    @State private var gameOver = false
    @State private var guesses:[Guess] = []
    @AppStorage("score") private var bestScore:Int = -1
    var body: some View {
        ScrollView{
            VStack (spacing: 10){
                ForEach(guesses,id: \.num ) {
                    Text("\($0.id).\t\($0.num)\t\($0.a)A\($0.b)B")
                        .padding(7.5)
                        .frame(maxWidth: .infinity)
                        .background(Color("GameColor"))
                        .cornerRadius(10)
                        .id($0.id)
                        .font(.title3)
                }
                
                DigiTextView(
                    placeholder: String(localized: "4 unique numbers", comment: ""),
                    text: $guessNum,
                    presentingModal: false
                )
                .cornerRadius(10)
                Button("Guess") {
                    if(check(nums: guessNum)){
                        var a = 0
                        var b = 0
                        for i in 0..<4 {
                            for j in 0..<4 {
                                if(guessNum[i]==ans[j]){
                                    if(i==j){
                                        a+=1
                                    }else{
                                        b+=1
                                    }
                                }
                            }
                        }
                        
                        guesses.append(Guess(id: guesses.count + 1,num: guessNum, a: a, b: b))
                        guessNum = ""
                        if a == 4{
                            if(guesses.count < bestScore || bestScore == -1){
                                bestScore = guesses.count
                            }
                            gameOver = true
                            
                            WKInterfaceDevice().play(.success)
                        }
                        
                    }else{
                        WKInterfaceDevice().play(.retry)
                    }
                }
                .buttonStyle(.borderedProminent)
                .cornerRadius(10)
            }
            .alert("You win", isPresented: $gameOver, actions: {Button("Restart") {
                ans = getAns()
                guesses = []
                WKInterfaceDevice()
                    .play(.start)
            }},message: {
                Text("You guessed the number correctly,\nYou have guessed \(guesses.count) times total!")
            })
            .font(.body)
        }.navigationTitle("Game")
            .animation(.easeInOut, value: guesses.count)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environment(\.locale, .init(identifier: "zh-Hant"))
            .environment(\.locale, .init(identifier: "en"))
    }
}
