//
//  ExerciseView.swift
//  iOSApp
//
//  Created by Dawit Chernet on 2026-05-21.
//

import SwiftUI

struct ExerciseView: View {
    @State private var timer = 10
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Coffee Pickup Timer")
                .font(.title)
            
            Text("\(timer) minutes")
                .font(.largeTitle)
                .bold()
        }
        .padding()
    }
}

#Preview {
    ExerciseView()
}
