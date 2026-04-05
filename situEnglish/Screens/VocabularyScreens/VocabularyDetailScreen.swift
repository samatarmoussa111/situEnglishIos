import SwiftUI

struct VocabularyDetailScreen: View {
    let lessonTitle: String

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.Layout.xxl) {
                headerSection
                keyWordsSection
                contextSection
            }
            .padding(Spacing.Layout.lg)
        }
        .background(Color.appBackground)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension VocabularyDetailScreen {
    var headerSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppBadge("Vocabulary Detail", variant: .primary)
            AppText(lessonTitle, style: .h1)
            AppText(
                "Learn useful words in context so you can understand them faster and reuse them in real conversations.",
                style: .bodyText,
                color: .appMutedForeground
            )
        }
    }

    var keyWordsSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText("Key words", style: .bodyBoldText)

            VStack(spacing: Spacing.Layout.md) {
                AppListItem(
                    "boarding pass",
                    subtitle: "The document you show before entering the plane.",
                    leadingIcon: "ticket.fill",
                    showsChevron: false
                )

                AppListItem(
                    "check in",
                    subtitle: "The action of confirming your flight before departure.",
                    leadingIcon: "checkmark.circle.fill",
                    showsChevron: false
                )

                AppListItem(
                    "gate",
                    subtitle: "The area where passengers wait to board the plane.",
                    leadingIcon: "door.left.hand.open",
                    showsChevron: false
                )
            }
        }
    }

    var contextSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText("Context example", style: .bodyBoldText)

            VStack(alignment: .leading, spacing: Spacing.Layout.sm) {
                AppText(
                    "\"Excuse me, where is gate 14? I need to check in and show my boarding pass.\"",
                    style: .bodyText,
                    color: .appCardForeground
                )
                AppText(
                    "This type of short dialogue helps you memorize the words inside a real situation instead of studying them alone.",
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
}
