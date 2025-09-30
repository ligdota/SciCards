//
//  Topic.swift
//  SciCards
//
//  Created by nick shier on 2025-09-17.
//

import SwiftUI



struct Topic : Identifiable {
    let id = UUID()
    let name: String
    var isSelected: Bool = false
}

struct TopicView: View {
    @State private var topics: [Topic] = [
        Topic(name: "Cell Biology"),
        Topic(name: "Reproduction"),
        Topic(name: "Embyrogenesis and Development"),
        Topic(name: "Nervous System"),
        Topic(name: "Endrocrine System"),
        Topic(name: "Respiratory System"),
        Topic(name: "Cardiovascular System"),
        Topic(name: "Immune System"),
        Topic(name: "Digestive System"),
        Topic(name: "Homeostasis"),
        Topic(name: "Musculoskeletal System"),
        Topic(name: "Genetics and Evolution")
    ]
    
    private var topicSelected: Bool {
        topics.contains(where: { $0.isSelected })
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body : some View {
        VStack {
            Text("Biology Topics")
                .font(.largeTitle)
                .padding()
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(topics.indices, id: \.self) { index in
                        let topic = topics[index]
                        Button(action: {
                            topics[index].isSelected.toggle()
                        }) {
                            Text(topic.name)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(topic.isSelected ? Color.blue : Color.gray.opacity(0.2))
                                .cornerRadius(12)
                        }
                    }
                }
                .padding()
            }
            if topicSelected {
                VStack(spacing: 12) {
                    Button(action : {
                        
                    }) {
                        Text("Start")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                
            }
            Button("Add More Topics") {
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.green)
            .foregroundColor(.white)
            .cornerRadius(12)
            
        }
        .padding()
    }
}



#Preview {
    TopicView()
}
