//
//  MainDatabase.swift
//  SciCards
//
//  Created by nick shier on 2025-09-24.
//

import GRDB
import Foundation


struct MainDatabase {
    static var shared: MainDatabase!
    
    let dbQueue: DatabaseQueue
    
    private init(dbQueue: DatabaseQueue) {
        self.dbQueue = dbQueue
    }
    
    
    
    static func setup() throws {
        let fileManager = FileManager.default
        let appSupportURL = try fileManager.url(
            for: .applicationSupportDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        )
        let dbURL = appSupportURL.appendingPathComponent("Flashcard.sqlite")
        
        let dbQueue = try DatabaseQueue(path: dbURL.path)
        var migrator = DatabaseMigrator()
        
        migrator.registerMigration("CreateDeck") { db in
            try db.create(table: "deck") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("name", .text).notNull()
                t.column("parent_id", .integer).references("deck", onDelete: .cascade)
                t.column("description", .text)
                t.column("created_at", .datetime).defaults(sql: "CURRENT_TIMESTAMP")
            }
        }
        
        migrator.registerMigration("CreateCard") { db in
            try db.create(table: "card") {t in
                t.autoIncrementedPrimaryKey("id")
                t.column("deck_id", .integer).notNull().references("deck", onDelete: .cascade)
                t.column("question", .text).notNull()
                t.column("answer", .text).notNull()
                t.column("ease_factor", .double).defaults(to: 2.5)
                t.column("interval_days", .integer).defaults(to: 0)
                t.column("due_date", .datetime)
                t.column("created_at", .datetime).defaults(sql: "CURRENT_TIMESTAMP")
            }
        }
        
        try migrator.migrate(dbQueue)
        
        shared = MainDatabase(dbQueue: dbQueue)
    }
}
