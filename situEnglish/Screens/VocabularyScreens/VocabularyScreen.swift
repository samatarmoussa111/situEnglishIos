import SwiftUI

struct VocabularyScreen: View {
    private let vocabularyLessons: [VocabularyLesson] = [
        VocabularyLesson(
            title: "At the Airport",
            subtitle: "Essential travel words and expressions for check-in and boarding.",
            icon: "airplane",
            level: "Beginner",
            duration: "6 min"
        ),
        VocabularyLesson(
            title: "Restaurant English",
            subtitle: "Useful phrases for ordering food and asking for the bill.",
            icon: "fork.knife",
            level: "Beginner",
            duration: "8 min"
        ),
        VocabularyLesson(
            title: "Office Vocabulary",
            subtitle: "Core words for meetings, tasks and daily work communication.",
            icon: "briefcase.fill",
            level: "Core",
            duration: "9 min"
        ),
        VocabularyLesson(
            title: "Shopping Conversations",
            subtitle: "Learn words for prices, sizes, colors and customer questions.",
            icon: "bag.fill",
            level: "Core",
            duration: "7 min"
        ),
        VocabularyLesson(
            title: "Daily Routines",
            subtitle: "Common words and verbs used in everyday life.",
            icon: "sun.max.fill",
            level: "Practice",
            duration: "5 min"
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

private extension VocabularyScreen {
    var headerSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText("Build practical vocabulary for real situations.", style: .h1)

            AppText(
                "Explore useful vocabulary packs organized by context so you can remember words more naturally.",
                style: .bodyText,
                color: .appMutedForeground
            )
        }
    }

    var lessonsSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText("All lessons", style: .bodyBoldText)

            VStack(spacing: Spacing.Layout.md) {
                ForEach(vocabularyLessons) { lesson in
                    NavigationLink {
                        VocabularyDetailScreen(lessonTitle: lesson.title)
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

private struct VocabularyLesson: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let icon: String
    let level: String
    let duration: String
}
