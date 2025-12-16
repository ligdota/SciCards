//
//  Card.swift
//  SciCards
//
//  Created by nick shier on 2025-09-24.
//


import GRDB
import Foundation


struct Flashcard: Identifiable, Codable, FetchableRecord, PersistableRecord {
    static let databaseTableName = "Flashcards"
    let id: String
    let subject: String
    let topic: String
    let format: String
    let question: String
    let answer: String
    let wrong_answers: [String]
    
    
    var allOptions: [String] {
        ([answer] + wrong_answers).shuffled()
    }
}

