//
//  ContentView.swift
//  MultiplicationWithMatilda
//
//  Created by Ibukunoluwa Soyebo on 25/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    private lazy var availableMultiplicationTables = numberMultipliers()
    @State private var selectedTimesTable = 1
    @State private var isPlaying = true
    @State private var selectedDifficulty = 5
    @State private var correctAnswer = 0
    @State private var currentQuestionNumber = 1
    @State private var question = ""
    @State private var answer = ""
    
    
    private var arrayDifficulty = [5,10,15,20]
    
     
    func numberMultipliers() -> [Int]{
        var singleNumber = 1
        var arrayNumber = [singleNumber]
        while(singleNumber < 12){
            singleNumber += 1
            arrayNumber.append(singleNumber)
        }
        return arrayNumber
    }
    
    func createQuestion(){
        let randomNumber = (0...12).randomElement() ?? 1
        let m = selectedTimesTable * randomNumber
        correctAnswer = m
        question = "\(m) x \(randomNumber)"
    }
    
    var body: some View {
        Group{
            Form{
                Section(header: Text("Times Table")){
                    Stepper(value: $selectedTimesTable, in: 1...12, step: 1) {
                        Text("\(selectedTimesTable) times table")
                    }
                }
                
                Section(header: Text("Difficulty")){
                    Stepper(value: $selectedDifficulty, in: 5...20, step: 5) {
                        Text("\(selectedDifficulty) questions")
                    }
                }
                
                Section(header: Text("Here's your question!")){
                    Text(question)
                    TextField("What's your answer? ", text: $answer)
                        .keyboardType(.numberPad)
                }
                
                Section{
                    Button("Submit!"){
                        createQuestion()
                    }
                }
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
