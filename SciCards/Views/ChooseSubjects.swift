//
//  ChooseSubjects.swift
//  SciCards
//
//  Created by nick shier on 2025-09-17.
//

//
//  ChooseSubjectsView.swift
//  SciCards
//
//  Created by Nick Shier on 2025-09-17.
//

import SwiftUI

struct SubjectButton: View {
    var title: String
    var color: Color
    var icon: String
    
    var body: some View {
    
            VStack(spacing: 12) {
                // Icon
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .padding(14)
                    .background(Color.white.opacity(0.7))
                    .clipShape(Circle())
                
                // Title
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, minHeight: 170)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(20)
            .shadow(color: color.opacity(0.4), radius: 8, x: 0, y: 6)
            .scaleEffect(1.0)
        }
    }


// Adds a little bounce when tapped
struct AnimatedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.93 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.5), value: configuration.isPressed)
    }
}





struct ChooseSubjectsView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient
                LinearGradient(colors: [.red, .green, .blue], startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    
                    
                    VStack(spacing: 8) {
                    Text("Choose Subjects to add")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Both subjects can be included at once. Click on a subject to add topics")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                
                    // subject buttons
                    VStack(spacing: 35) {
                        NavigationLink(destination: BiologyTopics()) {
                            SubjectButton(title: "Biology", color: .green, icon: "dna")
                        }
                
                        NavigationLink(destination: CSTopics()) {
                            SubjectButton(title: "Computer Science", color: .blue, icon: "computer")
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ChooseSubjectsView()
}
