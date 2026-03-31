import SwiftUI

struct MainTabView: View {
    init() {
        UITabBar.appearance().tintColor = UIColor(Color.appPrimary)
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.appSecondary)
    }

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            ReadingView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Reading")
                }

            VocabularyView()
                .tabItem {
                    Image(systemName: "text.book.closed.fill")
                    Text("Vocabulary")
                }

            TensesView()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("Tenses")
                }

            GrammarView()
                .tabItem {
                    Image(systemName: "pencil.and.outline")
                    Text("Grammar")
                }
        }
    }
}

private struct HomeView: View {
    var body: some View {
        HomeScreen()
    }
}

private struct ReadingView: View {
    var body: some View {
        SectionPlaceholderView(
            title: "Reading",
            subtitle: "Read short texts and understand English through context.",
            icon: "book.fill"
        )
    }
}

private struct VocabularyView: View {
    var body: some View {
        SectionPlaceholderView(
            title: "Vocabulary",
            subtitle: "Learn useful words and expressions you can reuse quickly.",
            icon: "text.book.closed.fill"
        )
    }
}

private struct TensesView: View {
    var body: some View {
        SectionPlaceholderView(
            title: "Tenses",
            subtitle: "Practice verb tenses with examples grounded in real situations.",
            icon: "clock.fill"
        )
    }
}

private struct GrammarView: View {
    var body: some View {
        SectionPlaceholderView(
            title: "Grammar",
            subtitle: "Understand grammar structures through simple and contextual lessons.",
            icon: "pencil.and.outline"
        )
    }
}

private struct SectionPlaceholderView: View {
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
                            "We now have the tab navigation in place. Next, we can design this section properly.",
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
    MainTabView()
        .preferredColorScheme(.light)
}

#Preview("Dark") {
    MainTabView()
        .preferredColorScheme(.dark)
}
