//
//  BiologyTopics.swift
//  SciCards
//
//  Created by nick shier on 2025-09-17.
//

import SwiftUI



struct BiologyTopics: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .fill(.white)
                .ignoresSafeArea(edges: .all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Biology Units")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal)
                    
                    VStack(spacing: 12) {
                        ForEach(topics) {
                            topic in SubjectTopicButton(topic: topic) {
                                
                            }
                        }
                    }
                }
            }
        }
    }
}
               
        

#Preview {
    BiologyTopics()
}

