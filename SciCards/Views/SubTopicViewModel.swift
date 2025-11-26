//
//  SubTopicViewModel.swift
//  SciCards
//
//  Created by nick shier on 2025-09-30.
//


import SwiftUI

class SubTopicViewModel: ObservableObject {
    @Published var counts: [String: Int] = [:]
    
    func loadFlashcardCounts(for topics: [String]) {
        do {
            var result: [String: Int] = [:]
            for topic in topics {
                let count = try DB.countQuestionsInSubtopic(in: topic)
                result[topic] = count
            }
            DispatchQueue.main.async {
                self.counts = result
            }
        } catch {
            print("Database error restart app: \(error)")
        }
    }
}
