//
//  ContentView.swift
//  SciCards
//
//  Created by nick shier on 2025-09-15.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showMainView: Bool = true
    
    var body: some View {
   
        Color.clear
            .fullScreenCover(isPresented: $showMainView) {
            MainView()
        }
    }
}

#Preview {
    ContentView()
}
