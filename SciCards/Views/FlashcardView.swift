//
//  FlashcardView.swift
//  SciCards
//
//  Created by nick shier on 2025-09-30.
//

import SwiftUI

struct FlashcardView: View {
    let card: Flashcard
    let selectedAnswer: String?
    let showFeedback: Bool
    let onSelectAnswer: (String) -> Void
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text(card.question)
                .font(.title2.bold())
                .multilineTextAlignment(.center)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .cornerRadius(15)          
            
            
            if card.format == "MC" {
                VStack(spacing: 12) {
                    ForEach(card.wrong_answers, id: \.self) { option in
                        Button {
                            onSelectAnswer(option)
                        } label: {
                            Text(option)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(buttonColor(option: option))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                        
                        
                        .disabled(showFeedback)
                    }
                    Button {
                        onSelectAnswer(card.answer)
                    } label: {
                        Text(card.answer)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(buttonColor(option: card.answer))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    
                    
                    if showFeedback {
                        Button("Next") {
                            onNext()
                        }
                        .padding()
                        .frame(maxWidth: 200)
                        .background(.white.opacity(0.9))
                        .foregroundColor(.green)
                        .cornerRadius(12)
                        .padding(.top, 10)
                    }
                }
            } else {
                VStack(spacing: 12) {
                    if showFeedback {
                        Text(card.answer)
                            .font(.title2.bold())
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.white.opacity(0.2))
                            .cornerRadius(12)
                        
                        Button("Next") {
                            onNext()
                        }
                        .padding()
                        .frame(maxWidth: 200)
                        .background(.white.opacity(0.9))
                        .foregroundColor(.green)
                        .cornerRadius(12)
                    } else {
                        Text("Tap to reveal answer")
                            .foregroundColor(.white.opacity(0.8))
                            .padding()
                            .onTapGesture {
                                onSelectAnswer(card.answer)
                            }
                    }
                }
            }
        }
        .animation(.easeInOut, value: showFeedback)
    }
    
    private func buttonColor(option: String) -> Color {
        guard showFeedback else {
            return .blue
        }
        if option == card.answer {
            return .green
        }
        if option == selectedAnswer {
            return .red
        }
        return .gray
    }
}
