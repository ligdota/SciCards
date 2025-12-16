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
    @Published var flashcards: [Flashcard] = []
    @Published private(set) var currentIndex: Int = 0
    @Published var selectedAnswer: String? = nil
    @Published var showFeedback: Bool = false
    
    
    init(previewCards: [Flashcard] = []) {
        self.flashcards = previewCards
        self.currentIndex = 0
    }
    
    var currentCard: Flashcard? {
        guard currentIndex < flashcards.count else { return nil }
        return flashcards[currentIndex]
    }
    
    // load the flashcards for a given topic
    // for now just biology and computer science
    func loadFlashcards(subject: String, topics: [String])  async {
        do {
            let cards = try await DB.queue.read { db in
                try Flashcard
                    .filter(Column("subject") == subject)
                    .filter(topics.contains(Column("topic")))
                    .fetchAll(db)
                    .shuffled()
            }
            print("Loading subject:", subject)
            print("Loading topics:", topics)
            print("Cards found:", cards.count)
            
            
            self.flashcards = cards
            print("loaded ", subject, "count", cards.count)
            currentIndex = 0
            selectedAnswer = nil
            showFeedback = false
        } catch {
            print("error loading flashcards", error)
            self.flashcards = []
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
