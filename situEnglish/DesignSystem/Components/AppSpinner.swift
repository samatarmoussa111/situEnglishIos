//
//  AppSpinner.swift
//  situEnglish
//
//  Created by Codex on 3/30/26.
//

import SwiftUI

struct AppSpinner: View {
    let size: Spacing.SpinnerSize
    let color: Color

    @State private var isAnimating = false

    init(
        size: Spacing.SpinnerSize = .small,
        color: Color = .appPrimary
    ) {
        self.size = size
        self.color = color
    }

    var body: some View {
        Circle()
            .trim(from: 0.15, to: 1)
            .stroke(
                color,
                style: StrokeStyle(lineWidth: size.lineWidth, lineCap: .round)
            )
            .frame(width: size.diameter, height: size.diameter)
            .rotationEffect(.degrees(isAnimating ? 360 : 0))
            .animation(
                .linear(duration: 0.8).repeatForever(autoreverses: false),
                value: isAnimating
            )
            .onAppear {
                isAnimating = true
            }
    }
}
