//
//  database.swift
//  SciCards
//
//  Created by nick shier on 2025-11-25.
//

import Foundation
import GRDB


struct DB {
    static var queue: DatabaseQueue!
    
    static func setup() throws {
        let dbURL = try copyDatabaseIfNeeded()
        queue = try DatabaseQueue(path: dbURL.path)
    }
    
    
    
    static func copyDatabaseIfNeeded() throws -> URL {
        let fileManager = FileManager.default
        
        let documents = try fileManager.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        )
        
        let dbURL = documents.appendingPathComponent("flashcards-2.db")
        
        if !fileManager.fileExists(atPath: dbURL.path) {
            guard let bundled = Bundle.main.url(forResource: "flashcards-2", withExtension: "db")
            else {
                fatalError("Missing important database files")
            }
            
            try fileManager.copyItem(at: bundled, to: dbURL)
        }
        return dbURL
    }
    
    
    
    
    
    static func countQuestionsInSubtopic(in topic: String) throws -> Int {
        try queue.read { db in
            try Int.fetchOne(db, sql: "SELECT COUNT(*) FROM Flashcards WHERE topic = ?", arguments: [topic]
            ) ?? 0
        }
    }
}

