//
//  GuideView.swift
//  game1a2b Watch App
//
//  Created by Cheng Yan Yang on 2023/7/18.
//

import SwiftUI

struct GuideView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 15){
                Text("1A2B is a classic number guessing game. You will get a corresponding prompt after each guess. Your goal is to guess the number selected by the computer.")
                VStack(spacing: 5){
                    Text("Game rules")
                        .font(.headline)
                        .bold()
                    Text("1. The computer chooses a four-digit number as the answer, and each number is unique.")
                    Text("2. The player guesses a four-digit number as the answer.")
                    Text("3. The computer will give corresponding prompts according to the guessed answers, and the prompts are represented by \"A\" and \"B\":")
                    Text("\t\"A\" means the number is correct and in the correct position.")
                    Text("\t\"B\" means the number is correct but the position is not correct.")
                    Text("4. The player proceeds to the next round of guessing according to the prompts until the answer is correct.")
                    Text("5. The player makes strategic adjustments based on the results of each guess to improve the chance of guessing the answer.")
                }
                VStack(spacing: 5){
                    Text("Game corresponding prompt example")
                        .font(.headline)
                        .bold()
                    Text("Suppose the answer chosen by the computer is \"1234\", and the player guesses \"5678\" for the first time, the prompt given by the computer is \"0A0B\", which means that no number is correct.")
                    Text("The player guesses \"4321\" for the second time, and the computer gave a prompt of \"0A4B\", indicating that there are four correct numbers, but none of the positions are correct.")
                    Text("The player guesses \"1243\" for the third time, and the computer prompts \"2A2B\", indicating that two numbers are correct and in the correct position, and the other two numbers are correct but in the wrong position.")
                }
                VStack(spacing: 5){
                    Text("Game strategy advice")
                        .font(.headline)
                        .bold()
                    Text("1. The initial guess is a four-digit number chosen at random and adjusted for each guess.")
                    Text("2. According to the hints of each guess, some impossible numbers can be excluded, and the numbers with higher probability can be guessed first.")
                    
                }
                VStack(spacing: 5){
                    Text("Game over condition")
                        .font(.headline)
                        .bold()
                    Text("The player guesses the number selected by the computer. That is, the guessed answer is completely consistent with the answer. The game is over, and the player wins.")
                }
            }.padding()
        }.navigationTitle("Tutorial")
    }
}


struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
