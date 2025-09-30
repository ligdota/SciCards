//
//  DatabaseManager.swift
//  SciCards
//
//  Created by nick shier on 2025-09-29.
//


import Foundation
import GRDB


final class DatabaseManager {
    static let shared = DatabaseManager()
    private(set) var dbQueue: DatabaseQueue!
    
    private init() {}
    
    
    //call this once on app launch after copying db
    func setupDatabase(at path: URL) {
        do {
            dbQueue = try DatabaseQueue(path: path.path)
            
        } catch {
            fatalError("Failed to open database try to restart the app")
        }
    }
}
