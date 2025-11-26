//
//  MultipleChoiceView.swift
//  SciCards
//
//  Created by nick shier on 2025-09-30.
//



import SwiftUI



struct MultipleChoiceOptions: View {
    let card: Flashcard
    @State private var userSelected: String? = nil
    @State private var showResult = false
    @State private var options: [String] = []
    
    
    var body: some View {
        VStack {
            ForEach(card.allOptions.shuffled(), id: \.self) { option in
                Button(option) {
                    userSelected = option
                    showResult = true
                }
            }
        }
    }
}


