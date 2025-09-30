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
    
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(card.allOptions, id: \.self) { option in
                Button(action: {
                    userSelected = option
                    showResult = true
                }) {
                    Text(option)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(buttonColor(option: option))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(showResult)
            }
            if showResult, let selected = userSelected {
                Text(selected == card.answer ? " Correct! " : " no i dont think so")
                    .font(.headline)
                    .foregroundColor(selected == card.answer ? .green : .red)
                    .padding(.top, 10)
            }
        }
    }
    
    private func buttonColor(option: String) -> Color {
        if showResult {
            if option == card.answer { return .green }
            if option == userSelected { return .red }
            return .gray.opacity(0.5)
        }
        return .blue
    }
}
