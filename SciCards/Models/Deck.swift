//
//  Deck.swift
//  SciCards
//
//  Created by nick shier on 2025-09-24.
//

import GRDB
import Foundation

struct Deck: Codable, FetchableRecord, PersistableRecord {
    var id: Int32?
    var name: String
    var parentId: Int32?
    var description: String?
    var createdAt: Date?
    
    
    var isRoot: Bool {
        return parentId == nil
    }
}


