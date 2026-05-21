//
//  ImageExtension.swift
//  iOSApp
//
//  Created by Dawit Chernet on 2026-05-21.
//

import SwiftUI

extension Image {
    func thumbnailStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .cornerRadius(12)
    }
}

