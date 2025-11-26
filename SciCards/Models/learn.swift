//
//  Learning.swift
//  SciCards
//
//  Created by nick shier on 2025-11-25.
//

import Foundation
import GRDB
import SwiftUI



@MainActor
class LearningViewModel: ObservableObject {
    @Published private(set) var flashcards: [Flashcard] = []
    @Published private(set) var currentIndex: Int = 0
    @Published var selectedAnswer: String? = nil
    @Published var showFeedback: Bool = false
    
    var currentCard: Flashcard? {
        guard currentIndex < flashcards.count else { return nil }
        return flashcards[currentIndex]
    }
    
    // load the flashcards for a given topic
    // for now just biology and computer science
    func loadFlashcards(subject: String)  {
        do {
            flashcards = try DB.queue.read { db in
                try Flashcard
                    .filter(Column("subject") == subject)
                    .fetchAll(db)
                    .shuffled()
            }
            currentIndex = 0
            selectedAnswer = nil
            showFeedback = false
        } catch {
            fatalError("Error: Cant load flashcards: \(error)")
        }
    }
    
    
    func checkAnswer(_ answer: String) {
        guard let card = currentCard else { return }
        selectedAnswer = answer
        showFeedback = true
        let isCorrect = (answer == card.answer)
    }
    
    func goToNextCard() {
        if currentIndex < flashcards.count - 1 {
            currentIndex += 1
            selectedAnswer = nil
            showFeedback = false
        } else {
            currentIndex = flashcards.count
        }
    }
    
    
    func restart() {
        currentIndex = 0
        flashcards.shuffle()
        selectedAnswer = nil
        showFeedback = false
    }
}
