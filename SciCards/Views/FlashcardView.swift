//
//  FlashcardView.swift
//  SciCards
//
//  Created by nick shier on 2025-09-30.
//

import SwiftUI

struct FlashcardView: View {
    let card: Flashcard
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(card.question).font(.headline)
            
            if card.format == "MC" {
                MultipleChoiceOptions(card: card)
            } else {
                Text("Answer: \(card.answer)").font(.subheadline)
            }
        }
        .padding()
    }
}
