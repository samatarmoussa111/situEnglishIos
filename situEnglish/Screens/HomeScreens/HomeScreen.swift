import SwiftUI

struct HomeScreen: View {
    private let grammarLessons: [GrammarLesson] = [
        GrammarLesson(
            title: "Present Simple",
            subtitle: "Talk about routines, habits and facts.",
            icon: "sun.max.fill",
            level: "Beginner",
            duration: "6 min"
        ),
        GrammarLesson(
            title: "Present Continuous",
            subtitle: "Describe actions happening now.",
            icon: "figure.walk",
            level: "Beginner",
            duration: "8 min"
        ),
        GrammarLesson(
            title: "Past Simple",
            subtitle: "Speak about finished actions in the past.",
            icon: "clock.arrow.circlepath",
            level: "Core",
            duration: "10 min"
        ),
        GrammarLesson(
            title: "Future with Will",
            subtitle: "Make predictions and instant decisions.",
            icon: "sparkles",
            level: "Core",
            duration: "7 min"
        ),
        GrammarLesson(
            title: "Question Forms",
            subtitle: "Build natural yes/no and open questions.",
            icon: "questionmark.bubble.fill",
            level: "Practice",
            duration: "9 min"
        )
    ]

    var body: some View {
            ZStack {
                Color.appBackground
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: Spacing.Layout.xxl) {
                        headerSection
                        lessonsSection
                    }
                    .padding(Spacing.Layout.lg)
                }
            }
        
    }
}

private extension HomeScreen {
    var headerSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppBadge("Grammar Lessons", variant: .primary)

            AppText("Learn English grammar with clear, contextual lessons.", style: .h1)

            AppText(
                "Start with the essentials and progress through practical grammar lessons you can reuse in real conversations.",
                style: .bodyText,
                color: .appMutedForeground
            )
        }
    }

    var lessonsSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText("All lessons", style: .bodyBoldText)

            VStack(spacing: Spacing.Layout.md) {
                ForEach(grammarLessons) { lesson in
                    NavigationLink {
                        GrammarDetailScreen(lessonTitle: lesson.title)
                    } label: {
                        AppListItem(
                            lesson.title,
                            subtitle: lesson.subtitle,
                            leadingIcon: lesson.icon,
                            badgeTitle: lesson.level,
                            trailingText: lesson.duration
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

private struct GrammarLesson: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let icon: String
    let level: String
    let duration: String
}
