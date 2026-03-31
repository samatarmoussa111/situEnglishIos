//
//  AppBadge.swift
//  situEnglish
//
//  Created by Codex on 3/30/26.
//

import SwiftUI

enum AppBadgeVariant {
    case `default`
    case primary
}

struct AppBadge: View {
    let title: String
    let variant: AppBadgeVariant

    init(
        _ title: String,
        variant: AppBadgeVariant = .default
    ) {
        self.title = title
        self.variant = variant
    }

    var body: some View {
        AppText(title, style: .captionBoldText, color: foregroundColor)
            .padding(.horizontal, Spacing.Layout.md)
            .padding(.vertical, Spacing.Layout.xs)
            .background(backgroundColor)
            .clipShape(Capsule())
    }
}

private extension AppBadge {
    var backgroundColor: Color {
        switch variant {
        case .default:
            return .appSecondary
        case .primary:
            return .appPrimary
        }
    }

    var foregroundColor: Color {
        switch variant {
        case .default:
            return .appSecondaryForeground
        case .primary:
            return .appPrimaryForeground
        }
    }
}
