//
//  testDB.swift
//  SciCards
//
//  Created by nick shier on 2025-09-30.
//


import SwiftUI


struct FlashcardTest: View {
    @State private var flashcards: [Flashcard] = []
    
    
    var body: some View {
        List(flashcards, id: \.id) { card in
            VStack(alignment: .leading) {
                Text(card.question).font(.headline)
                Text("Answer: \(card.answer)").font(.subheadline)
            }
        }
        .onAppear {
            do {
                flashcards = try DB.queue.read { db in
                    try Flashcard.fetchAll(db)
                }
            } catch {
                print(" fetch failed: \(error)")
            }
        }
        
    }
}
