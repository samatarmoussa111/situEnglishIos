import SwiftUI

struct HomeScreen: View {
    private let gridColumns = [
        GridItem(.flexible(), spacing: Spacing.Layout.md),
        GridItem(.flexible(), spacing: Spacing.Layout.md)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: Spacing.Layout.xxl) {
                    headerSection
                    progressSection
                    continueSection
                    exploreSection
                    todaySection
                }
                .padding(Spacing.Layout.lg)
            }
            .background(Color.appBackground)
            .navigationBarHidden(true)
        }
    }
}

private extension HomeScreen {
    var headerSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppBadge("7-day streak", variant: .primary)

            AppText("Learn English in context.", style: .h1)

            AppText(
                "Contextly helps you learn vocabulary, grammar and reading through everyday situations.",
                style: .bodyText,
                color: .appMutedForeground
            )
        }
    }

    var progressSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.lg) {
            HStack {
                VStack(alignment: .leading, spacing: Spacing.Layout.xs) {
                    AppText("Today’s focus", style: .bodyBoldText, color: .appCardForeground)
                    AppText("Travel English", style: .h3, color: .appCardForeground)
                }

                Spacer()

                AppIcon(name: "sparkles", size: .lg, color: .appPrimary)
            }

            VStack(alignment: .leading, spacing: Spacing.Layout.sm) {
                AppText("You’ve completed 3 of 5 activities.", style: .bodyText, color: .appMutedForeground)

                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color.appInput)

                        Capsule()
                            .fill(Color.appPrimary)
                            .frame(width: geometry.size.width * 0.6)
                    }
                }
                .frame(height: 10)
            }

            AppButton(variant: .primary, size: .medium) { } content: {
                HStack {
                    AppIcon(name: "play.fill")
                    Text("Continue lesson")
                }
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

    var continueSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText("Continue with context", style: .bodyBoldText)

            VStack(spacing: Spacing.Layout.md) {
                AppListItem(
                    "Airport check-in",
                    subtitle: "Learn what to say before boarding",
                    leadingIcon: "airplane",
                    badgeTitle: "Beginner",
                    trailingText: "6 min"
                )

                AppListItem(
                    "At the restaurant",
                    subtitle: "Order food naturally and ask follow-up questions",
                    leadingIcon: "fork.knife",
                    trailingText: "10 min"
                )
            }
        }
    }

    var exploreSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText("Explore", style: .bodyBoldText)

            LazyVGrid(columns: gridColumns, spacing: Spacing.Layout.md) {
                HomeFeatureCard(
                    title: "Vocabulary",
                    subtitle: "Words you’ll reuse",
                    icon: "text.book.closed.fill"
                )

                HomeFeatureCard(
                    title: "Reading",
                    subtitle: "Short real-life texts",
                    icon: "doc.text.fill"
                )

                HomeFeatureCard(
                    title: "Tenses",
                    subtitle: "Use verbs with confidence",
                    icon: "clock.arrow.circlepath"
                )

                HomeFeatureCard(
                    title: "Grammar",
                    subtitle: "Clear rules with context",
                    icon: "textformat.abc"
                )
            }
        }
    }

    var todaySection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText("Today", style: .bodyBoldText)

            VStack(spacing: Spacing.Layout.md) {
                AppListItem(
                    "5 new words unlocked",
                    leadingIcon: "bolt.fill",
                    badgeTitle: "New",
                    badgeVariant: .primary,
                    showsChevron: false
                )

                AppListItem(
                    "Reading challenge",
                    subtitle: "Read a short conversation and answer 3 questions",
                    leadingIcon: "message.fill",
                    trailingText: "4 min"
                )
            }
        }
    }
}

private struct HomeFeatureCard: View {
    let title: String
    let subtitle: String
    let icon: String

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppIcon(name: icon, size: .lg, color: .appPrimary)

            VStack(alignment: .leading, spacing: Spacing.Layout.xs) {
                AppText(title, style: .bodyBoldText, color: .appCardForeground)
                AppText(subtitle, style: .captionText, color: .appMutedForeground)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 132, alignment: .topLeading)
        .padding(Spacing.Layout.lg)
        .background(Color.appCard)
        .overlay {
            RoundedRectangle(cornerRadius: Spacing.Radius.lg)
                .stroke(Color.appBorder, lineWidth: 1)
        }
        .clipShape(RoundedRectangle(cornerRadius: Spacing.Radius.lg))
    }
}

#Preview {
    HomeScreen()
}
