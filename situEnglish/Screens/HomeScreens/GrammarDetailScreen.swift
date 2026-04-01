//
//  MyFirstScreen.swift
//  situEnglish
//
//  Created by samatar barkadleh on 4/1/26.
//

import SwiftUI

struct GrammarDetailScreen: View {
    let lessonTitle: String

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.Layout.xxl) {
                headerSection
                explanationSection
                examplesSection
            }
            .padding(Spacing.Layout.lg)
        }
        .background(Color.appBackground)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension GrammarDetailScreen {
    var headerSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppBadge("Grammar Detail", variant: .primary)
            AppText(lessonTitle, style: .h1)
            AppText(
                "This lesson helps you understand the rule, when to use it, and how to recognize it in real English sentences.",
                style: .bodyText,
                color: .appMutedForeground
            )
        }
    }

    var explanationSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText("Explanation", style: .bodyBoldText)

            VStack(alignment: .leading, spacing: Spacing.Layout.sm) {
                AppText(
                    "You will learn the core structure of this grammar point and how it changes depending on the subject and the context.",
                    style: .bodyText,
                    color: .appCardForeground
                )
                AppText(
                    "Focus on the form first, then notice how the meaning changes in everyday conversation.",
                    style: .bodyText,
                    color: .appMutedForeground
                )
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

    var examplesSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText("Examples", style: .bodyBoldText)

            VStack(spacing: Spacing.Layout.md) {
                AppListItem(
                    "Example 1",
                    subtitle: "\"I use this grammar structure in simple daily situations.\"",
                    leadingIcon: "quote.bubble.fill",
                    showsChevron: false
                )

                AppListItem(
                    "Example 2",
                    subtitle: "\"You can notice how the meaning becomes clearer with context.\"",
                    leadingIcon: "text.bubble.fill",
                    showsChevron: false
                )

                AppListItem(
                    "Example 3",
                    subtitle: "\"Practice with short sentences before moving to longer ones.\"",
                    leadingIcon: "checkmark.bubble.fill",
                    showsChevron: false
                )
            }
        }
    }
}
