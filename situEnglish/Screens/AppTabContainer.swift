import SwiftUI

private enum AppTab: String, CaseIterable, Identifiable {
    case home
    case vocabulary
    case reading
    case tenses
    case grammar

    var id: String { rawValue }

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .vocabulary:
            return "Vocab"
        case .reading:
            return "Reading"
        case .tenses:
            return "Tenses"
        case .grammar:
            return "Grammar"
        }
    }

    var icon: String {
        switch self {
        case .home:
            return "house.fill"
        case .vocabulary:
            return "text.book.closed.fill"
        case .reading:
            return "doc.text.fill"
        case .tenses:
            return "clock.arrow.circlepath"
        case .grammar:
            return "textformat.abc"
        }
    }
}

struct AppTabContainer: View {
    init() {
        let appearance = UITabBarAppearance()
        let selectedColor = UIColor(Color.appPrimary)
        let unselectedColor = UIColor(Color.appSecondary)
        let backgroundColor = UIColor(Color.appCard)
        let borderColor = UIColor(Color.appBorder)

        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor
        appearance.shadowColor = borderColor

        applyColors(to: appearance.stackedLayoutAppearance, selectedColor: selectedColor, unselectedColor: unselectedColor)
        applyColors(to: appearance.inlineLayoutAppearance, selectedColor: selectedColor, unselectedColor: unselectedColor)
        applyColors(to: appearance.compactInlineLayoutAppearance, selectedColor: selectedColor, unselectedColor: unselectedColor)

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Label(AppTab.home.title, systemImage: AppTab.home.icon)
                }

            SectionPlaceholderScreen(
                title: "Vocabulary",
                subtitle: "Build useful words through real situations and repetition.",
                icon: AppTab.vocabulary.icon
            )
            .tabItem {
                Label(AppTab.vocabulary.title, systemImage: AppTab.vocabulary.icon)
            }

            SectionPlaceholderScreen(
                title: "Reading",
                subtitle: "Read short contextual stories and extract meaning naturally.",
                icon: AppTab.reading.icon
            )
            .tabItem {
                Label(AppTab.reading.title, systemImage: AppTab.reading.icon)
            }

            SectionPlaceholderScreen(
                title: "Tenses",
                subtitle: "Understand when and why each tense is used in conversation.",
                icon: AppTab.tenses.icon
            )
            .tabItem {
                Label(AppTab.tenses.title, systemImage: AppTab.tenses.icon)
            }

            SectionPlaceholderScreen(
                title: "Grammar",
                subtitle: "Practice grammar patterns inside realistic English contexts.",
                icon: AppTab.grammar.icon
            )
            .tabItem {
                Label(AppTab.grammar.title, systemImage: AppTab.grammar.icon)
            }
        }
        .tint(.appPrimary)
    }
}

private extension AppTabContainer {
    func applyColors(
        to itemAppearance: UITabBarItemAppearance,
        selectedColor: UIColor,
        unselectedColor: UIColor
    ) {
        itemAppearance.selected.iconColor = selectedColor
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: selectedColor]
        itemAppearance.normal.iconColor = unselectedColor
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: unselectedColor]
    }
}

private struct SectionPlaceholderScreen: View {
    let title: String
    let subtitle: String
    let icon: String

    var body: some View {
        NavigationStack {
            ZStack {
                Color.appBackground
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: Spacing.Layout.xxl) {
                    VStack(alignment: .leading, spacing: Spacing.Layout.md) {
                        AppBadge("Soon")
                        AppText(title, style: .h1)
                        AppText(subtitle, style: .bodyText, color: .appMutedForeground)
                    }

                    VStack(alignment: .leading, spacing: Spacing.Layout.lg) {
                        AppIcon(name: icon, size: .lg, color: .appPrimary)
                        AppText("This screen is ready for the next step.", style: .bodyBoldText, color: .appCardForeground)
                        AppText(
                            "The navigation is in place. We can now design this section properly.",
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

                    Spacer()
                }
                .padding(Spacing.Layout.lg)
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview("Light") {
    AppTabContainer()
        .preferredColorScheme(.light)
}

#Preview("Dark") {
    AppTabContainer()
        .preferredColorScheme(.dark)
}
