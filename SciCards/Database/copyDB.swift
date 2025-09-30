//
//  copyDB.swift
//  SciCards
//
//  Created by nick shier on 2025-09-29.
//



import Foundation


func copyDatabaseIfNeeded() -> URL {
    let fileManager = FileManager.default

    let docsURL = try! fileManager.url(
        for: .documentDirectory,
        in: .userDomainMask,
        appropriateFor: nil,
        create: true
)

    let dbURL = docsURL.appendingPathComponent("flashcards.db")

// copy if only not copied

if !fileManager.fileExists(atPath: dbURL.path) {
    if let bundledDB = Bundle.main.url(forResource: "flashcards", withExtension: "db") {
        try! fileManager.copyItem(at: bundledDB, to: dbURL)
    }
}
    return dbURL
}
