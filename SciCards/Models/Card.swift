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
    let wrong1: String?
    let wrong2: String?
    let wrong3: String?
    
    
    var allOptions: [String] {
     var options = [answer]
        let wrongs = [wrong1, wrong2, wrong3].compactMap { $0 }
        options.append(contentsOf: wrongs)
        return options.shuffled()
    }

}

