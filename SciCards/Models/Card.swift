//
//  Card.swift
//  SciCards
//
//  Created by nick shier on 2025-09-24.
//


import GRDB
import Foundation


struct Flashcard : Codable, FetchableRecord, PersistableRecord {
    static let databaseTableName = "Flashcards"
    let id: String
    let subject: String
    let topic: String
    let format: String
    let question: String
    let answer: String
    let wrongAnswers: String?
    
    
    
    
    var wrongsArray: [String] {
        guard let data = wrongAnswers?.data(using: .utf8) else { return [] }
        return (try? JSONDecoder().decode([String].self, from: data)) ?? []
    }
    var allOptions: [String] {
        (wrongsArray + [answer]).shuffled()
    }
}
