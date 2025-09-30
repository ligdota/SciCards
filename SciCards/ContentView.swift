//
//  ContentView.swift
//  SciCards
//
//  Created by nick shier on 2025-09-15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Choose a Subject")
                    .font(.largeTitle)
                
                NavigationLink("ChooseSubjects") {
                    ChooseSubjectsView()
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    ContentView()
}
