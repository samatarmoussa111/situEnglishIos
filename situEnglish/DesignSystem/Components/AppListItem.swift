//
//  AppListItem.swift
//  situEnglish
//
//  Created by Codex on 3/30/26.
//

import SwiftUI

struct AppListItem: View {
    let title: String
    let subtitle: String?
    let leadingIcon: String?
    let badgeTitle: String?
    let badgeVariant: AppBadgeVariant
    let trailingText: String?
    let showsChevron: Bool
    let action: (() -> Void)?

    init(
        title: String,
        subtitle: String? = nil,
        leadingIcon: String? = nil,
        badgeTitle: String? = nil,
        badgeVariant: AppBadgeVariant = .default,
        trailingText: String? = nil,
        showsChevron: Bool = true,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.leadingIcon = leadingIcon
        self.badgeTitle = badgeTitle
        self.badgeVariant = badgeVariant
        self.trailingText = trailingText
        self.showsChevron = showsChevron
        self.action = action
    }

    var body: some View {
        Group {
            if let action {
                Button(action: action) {
                    itemContent
                }
                .buttonStyle(.plain)
            } else {
                itemContent
            }
        }
    }
}

private extension AppListItem {
    var itemContent: some View {
        HStack(spacing: Spacing.Layout.lg) {
            if let leadingIcon {
                RoundedRectangle(cornerRadius: Spacing.Radius.md)
                    .fill(Color.appSecondary)
                    .frame(width: 44, height: 44)
                    .overlay {
                        AppIcon(
                            name: leadingIcon,
                            size: .md,
                            color: .appSecondaryForeground
                        )
                    }
            }

            VStack(alignment: .leading, spacing: Spacing.Layout.xs) {
                HStack(spacing: Spacing.Layout.sm) {
                    AppText(title, style: .bodyBoldText, color: .appCardForeground)

                    if let badgeTitle {
                        AppBadge(badgeTitle, variant: badgeVariant)
                    }
                }

                if let subtitle {
                    AppText(subtitle, style: .captionText, color: .appMutedForeground)
                }
            }

            Spacer(minLength: Spacing.Layout.md)

            if let trailingText {
                AppText(trailingText, style: .captionBoldText, color: .appMutedForeground)
            }

            if showsChevron {
                AppIcon(name: "chevron.right", size: .sm, color: .appMutedForeground)
            }
        }
        .padding(Spacing.Layout.lg)
        .background(Color.appCard)
        .overlay {
            RoundedRectangle(cornerRadius: Spacing.Radius.lg)
                .stroke(Color.appBorder, lineWidth: 1)
        }
        .clipShape(RoundedRectangle(cornerRadius: Spacing.Radius.lg))
    }
}
