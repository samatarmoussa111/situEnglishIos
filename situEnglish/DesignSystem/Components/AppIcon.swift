//
//  AppIcon.swift
//  situEnglish
//
//  Created by Codex on 3/30/26.
//

import SwiftUI

private struct AppButtonIconSizeKey: EnvironmentKey {
    static let defaultValue: Spacing.IconSize? = nil
}

extension EnvironmentValues {
    var appButtonIconSize: Spacing.IconSize? {
        get { self[AppButtonIconSizeKey.self] }
        set { self[AppButtonIconSizeKey.self] = newValue }
    }
}

struct AppIcon: View {
    @Environment(\.appButtonIconSize) private var buttonIconSize

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
                .font(.system(size: resolvedSize.value, weight: .medium))
                .foregroundColor(color)
        } else {
            Image(systemName: name)
                .font(.system(size: resolvedSize.value, weight: .medium))
        }
    }

    private var resolvedSize: Spacing.IconSize {
        buttonIconSize ?? size
    }
}
