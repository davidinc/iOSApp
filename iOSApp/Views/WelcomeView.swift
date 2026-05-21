//
//  WelcomeView.swift
//  iOSApp
//
//  Created by Dawit Chernet on 2026-05-21.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "cup.and.saucer.fill")
                .font(.system(size: 80))
                .foregroundColor(.red)
            
            Text("Welcome to Tim Hortons Run")
                .font(.largeTitle)
                .bold()
            
            Text("Track your team's coffee orders quickly.")
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding()
    }
}

#Preview {
    WelcomeView()
}
