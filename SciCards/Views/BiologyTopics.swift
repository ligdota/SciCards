//
//  BiologyTopics.swift
//  SciCards
//
//  Created by nick shier on 2025-09-17.
//

import SwiftUI

struct BiologyTopics: View {
    
    let topics: [String] = [
        "Cell Biology",
        "Reproduction",
        "Embryogenesis and Development",
        "Endocrine System",
        "Cardiovascular System",
        "Respiratory System",
        "Nervous System",
        "Digestive System",
        "Homeostasis",
        "Immune System",
        "Musculoskeletal System",
        "Genetics and Evolution"
    ]
    @State private var viewModel = SubTopicViewModel()
    @State private var selectedTopics: Set<String> = []
    
    var body: some View {
            List {
                VStack(spacing: 0) {
                    Text("Biology Units")
                        .font(.largeTitle)
                        .bold()
                }
                ForEach(topics, id: \.self) { topic in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(topic)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            if  selectedTopics.contains(topic) {
                                selectedTopics.remove(topic)
                            } else {
                                selectedTopics.insert(topic)
                            }
                        }) {
                            Image(systemName: selectedTopics.contains(topic) ? "checkmark.circle.fill" : "plus.circle")
                                .foregroundColor(selectedTopics.contains(topic) ? .green : .blue)
                        }
                    }
                }
                
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .listStyle(.inset)
                
                Button(action: {
                    startLearning()
                }) {
                    Text("Start")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedTopics.isEmpty ? Color.gray : Color.blue)
                        .cornerRadius(12)
                        .padding([.horizontal, .bottom])
                }
                
                .disabled(selectedTopics.isEmpty)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemGray6))
                    .shadow(radius: 5)
                    .ignoresSafeArea()
            )
            .ignoresSafeArea(.keyboard)
            .onAppear {
                viewModel.loadFlashcardCounts(for: topics)
            }
            
        }
    }


        
func startLearning() {
    
}


#Preview {
    BiologyTopics()
}

