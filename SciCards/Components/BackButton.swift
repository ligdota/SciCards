//
//  BackButton.swift
//  SciCards
//
//  Created by nick shier on 2025-09-19.
//


import SwiftUI



struct BackButton: View {
    var action: () -> Void
    var label: String = "Back"
    var color: Color = .blue
    var body: some View {
        Button(action: action) {
            Text("Back")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(
                    LinearGradient(colors: [color.opacity(0.2), color.opacity(0.9)],
                                   startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                .cornerRadius(20)
                .foregroundColor(.primary)
                .buttonStyle(.plain)
                .shadow(color: color.opacity(0.7), radius: 8, x: 0, y: 6)
        }
    }
}

#Preview {
    BackButton(action:  { })
}
