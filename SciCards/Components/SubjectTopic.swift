//
//  SubjectTopic.swift
//  SciCards
//
//  Created by nick shier on 2025-09-17.
//


import SwiftUI

// Sub topic Model
struct SubjectTopic: Identifiable{
    let id = UUID()
    let title: String
    let description: String
    let quantity: Int
}


// Sub Topic View

struct SubjectTopicButton: View {
    var topic: SubjectTopic
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 8) {
                Text(topic.title)
                    .font(.headline)
                    .foregroundColor(.blue)
                
                Text("\(topic.quantity) cards")
                    .font(.caption)
                    .foregroundColor(.blue)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemGray6))
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            )
        }
        .buttonStyle(.plain)
    }
}

let topics : [SubjectTopic] = [
    
         SubjectTopic(title: "Cell Biology", description: "test", quantity: 10),
    
    
        SubjectTopic(title: "Reproduction", description: "test", quantity: 10),
    
         SubjectTopic(title: "Embryogenesis & Development", description: "test", quantity: 10),

    
         SubjectTopic(title: "Nervous System", description: "test", quantity: 10),
    
        
    
         SubjectTopic(title: "Endocrine System", description: "test", quantity: 10),
    
        
    
        SubjectTopic(title: "Respiratory System", description: "test", quantity: 10),
    
        
    
   
        SubjectTopic(title: "Cardiovascular System", description: "test", quantity: 10),
    
        
    
    
        SubjectTopic(title: "Immune System", description: "test", quantity: 10),
    
        
    
    
        SubjectTopic(title: "Digestive System", description: "test", quantity: 10),
    
        
   
        SubjectTopic(title: "Homeostasis", description: "test", quantity: 10),
    
        
    
   
        SubjectTopic(title: "Musculoskeletal System", description: "test", quantity: 10),
    
        
    
   
         SubjectTopic(title: "Genetics and Evolution", description: "test", quantity: 10)
    
    
]



