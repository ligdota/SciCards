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
        do {
            try DB.setup()
        } catch {
            fatalError("Database couldn't be set up: \(error)")
        }
        
        do {
            let count = try DB.queue.read { db in
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
            ContentView()
               
        }
    }
}

