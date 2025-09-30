//
//  SciCardsApp.swift
//  SciCards
//
//  Created by nick shier on 2025-09-15.
//

import SwiftUI

@main
struct SciCardsApp: App {
    init() {
        let dbURL = copyDatabaseIfNeeded()
        DatabaseManager.shared.setupDatabase(at: dbURL)
        do {
            let count = try DatabaseManager.shared.dbQueue.read { db in
                try Int.fetchOne(db, sql: "SELECT COUNT(*) FROM flashcards")
            }
            print("flashcards copied and ready .row count: \(count ?? 0)")
        } catch {
            print("Database error: \(error)")
        }
    }
    var body: some Scene {
        WindowGroup {
            FlashcardTest()
            //ContentView()
               
        }
    }
}

