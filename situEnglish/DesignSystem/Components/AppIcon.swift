//
//  AppIcon.swift
//  situEnglish
//
//  Created by Codex on 3/30/26.
//

import SwiftUI

struct AppIcon: View {
    let name: String
    let size: Spacing.IconSize
    let color: Color?

    init(
        name: String,
        size: Spacing.IconSize = .md,
        color: Color? = nil
    ) {
        self.name = name
        self.size = size
        self.color = color
    }

    var body: some View {
        if let color {
            Image(systemName: name)
                .font(.system(size: size.value))
                .foregroundColor(color)
        } else {
            Image(systemName: name)
                .font(.system(size: size.value))
        }
    }
}
