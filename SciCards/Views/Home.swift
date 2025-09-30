//
//  Home.swift
//  SciCards
//
//  Created by nick shier on 2025-09-17.
//


import SwiftUI

struct MainView : View {
    
    var body : some View {
        ZStack {
           
            VStack (spacing: 40) {
                Text("FlashLearn")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                
                VStack(spacing: 20) {
                    Text("The best place to reinforce your university level science knowledge")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .padding()
                .cornerRadius(25)
                .shadow(radius: 10)
                
                VStack(spacing: 10) {
                    Text("Learning Stats")
                        .font(.title2)
                        .foregroundColor(.white)
        
                    
                }
                .padding()
                
                .cornerRadius(25)
                .shadow(radius: 10)
                
                Spacer()
            }
            .padding(.top, 60)
            .padding(.horizontal, 20)
        }
    }
}
#Preview {
    MainView()
}

