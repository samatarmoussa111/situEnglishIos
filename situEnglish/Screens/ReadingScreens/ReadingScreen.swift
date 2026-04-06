import SwiftUI

struct ReadingScreen: View {
    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: Spacing.Layout.xxl) {
                    headerSection
                    formatsSection
                }
                .padding(Spacing.Layout.lg)
            }
        }
    }
}

private extension ReadingScreen {
    var headerSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText("Choose how you want to practice reading.", style: .h1)

            AppText(
                "Read short stories or realistic dialogues, then open a lesson and explore the key vocabulary.",
                style: .bodyText,
                color: .appMutedForeground
            )
        }
    }

    var formatsSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText("Formats", style: .bodyBoldText)

            VStack(spacing: Spacing.Layout.md) {
                NavigationLink {
                    ReadingStoriesScreen()
                } label: {
                    AppListItem(
                        "Stories",
                        subtitle: "Short reading passages with useful everyday object vocabulary.",
                        leadingIcon: "book.closed.fill",
                        badgeTitle: "3 lessons",
                        showsChevron: true
                    )
                }
                .buttonStyle(.plain)

                NavigationLink {
                    ReadingDialoguesScreen()
                } label: {
                    AppListItem(
                        "Dialogues",
                        subtitle: "Natural conversations between two or more people in daily situations.",
                        leadingIcon: "bubble.left.and.bubble.right.fill",
                        badgeTitle: "3 lessons",
                        showsChevron: true
                    )
                }
                .buttonStyle(.plain)
            }
        }
    }
}

struct ReadingStoriesScreen: View {
    private let readingLessons = ReadingLesson.storyLessons

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
        .navigationTitle("Stories")
    }
}

private extension ReadingStoriesScreen {
    var headerSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText("Read short stories and learn useful object vocabulary.", style: .h1)
            AppText(
                "Each lesson gives you a short story and a small vocabulary breakdown to help you understand the key words.",
                style: .bodyText,
                color: .appMutedForeground
            )
        }
    }

    var lessonsSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText("All stories", style: .bodyBoldText)

            VStack(spacing: Spacing.Layout.md) {
                ForEach(readingLessons) { lesson in
                    NavigationLink {
                        ReadingDetailScreen(lesson: lesson)
                    } label: {
                        AppListItem(
                            lesson.title,
                            subtitle: lesson.subtitle,
                            showsChevron: true
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

struct ReadingDialoguesScreen: View {
    private let dialogueLessons = ReadingLesson.dialogueLessons

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
        .navigationTitle("Dialogues")
    }
}

private extension ReadingDialoguesScreen {
    var headerSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText("Practice English through natural conversations.", style: .h1)
            AppText(
                "These lessons focus on dialogue format so you can follow how people speak in common situations.",
                style: .bodyText,
                color: .appMutedForeground
            )
        }
    }

    var lessonsSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText("All dialogues", style: .bodyBoldText)

            VStack(spacing: Spacing.Layout.md) {
                ForEach(dialogueLessons) { lesson in
                    NavigationLink {
                        ReadingDetailScreen(lesson: lesson)
                    } label: {
                        AppListItem(
                            lesson.title,
                            subtitle: lesson.subtitle,
                            showsChevron: true
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

struct ReadingLesson: Identifiable, Hashable {
    let id = UUID()
    let kind: ReadingLessonKind
    let title: String
    let subtitle: String
    let icon: String
    let level: String
    let duration: String
    let content: String
    let dialogue: [ReadingDialogueLine]
    let vocabulary: [ReadingVocabularyItem]
}

enum ReadingLessonKind: Hashable {
    case story
    case dialogue
}

struct ReadingDialogueLine: Identifiable, Hashable {
    let id = UUID()
    let speaker: String
    let message: String
}

struct ReadingVocabularyItem: Identifiable, Hashable {
    let id = UUID()
    let word: String
    let definition: String
    let example: String
    let icon: String
}

private extension ReadingLesson {
    static let storyLessons: [ReadingLesson] = [
        ReadingLesson(
            kind: .story,
            title: "A Small Apartment",
            subtitle: "Read a short story filled with common household objects.",
            icon: "house.fill",
            level: "Beginner",
            duration: "4 min",
            content: "Emma opens the door of her small apartment. Near the window, there is a table with a lamp and a book. A blue chair is next to the table. On the wall, she has a clock and a picture. In the kitchen, there is a fridge, a cup, and a plate on the counter. Before going to work, Emma picks up her bag, her keys, and her phone.",
            dialogue: [],
            vocabulary: [
                ReadingVocabularyItem(word: "lamp", definition: "A light you use on a table or near a bed.", example: "I turn on the lamp when I read at night.", icon: "lightbulb.fill"),
                ReadingVocabularyItem(word: "chair", definition: "A piece of furniture used for sitting.", example: "Please sit on the chair near the table.", icon: "chair.fill"),
                ReadingVocabularyItem(word: "fridge", definition: "A large kitchen machine that keeps food cold.", example: "The milk is in the fridge.", icon: "snowflake"),
                ReadingVocabularyItem(word: "keys", definition: "Small metal objects used to open a door or a lock.", example: "I always keep my keys in my bag.", icon: "key.fill")
            ]
        ),
        ReadingLesson(
            kind: .story,
            title: "In the Classroom",
            subtitle: "Discover everyday classroom vocabulary through a simple scene.",
            icon: "books.vertical.fill",
            level: "Beginner",
            duration: "5 min",
            content: "Mr. Lewis walks into the classroom with a notebook in his hand. The students are sitting at their desks. On each desk, there is a pencil, a notebook, and an eraser. A map hangs on the wall beside the board. Mia opens her backpack and takes out a ruler. When the lesson starts, everyone looks at the board and listens carefully.",
            dialogue: [],
            vocabulary: [
                ReadingVocabularyItem(word: "desk", definition: "A table used for work or study.", example: "My notebook is on the desk.", icon: "table.furniture"),
                ReadingVocabularyItem(word: "eraser", definition: "An object used to remove pencil marks.", example: "I need an eraser to fix this word.", icon: "rectangle.and.pencil.and.ellipsis"),
                ReadingVocabularyItem(word: "backpack", definition: "A bag carried on your back.", example: "She puts her books in her backpack.", icon: "backpack.fill"),
                ReadingVocabularyItem(word: "ruler", definition: "A straight tool used to measure or draw lines.", example: "Use a ruler to draw a clean line.", icon: "ruler.fill")
            ]
        ),
        ReadingLesson(
            kind: .story,
            title: "At the Grocery Store",
            subtitle: "Practice object vocabulary you often see while shopping.",
            icon: "cart.fill",
            level: "Core",
            duration: "6 min",
            content: "Daniel pushes a cart through the grocery store. He takes an apple, a bottle of water, and a box of cereal from the shelf. In the next aisle, he finds a basket full of bananas. Near the cashier, there is a newspaper and a small bag of candy. Daniel pays for everything, takes the receipt, and puts the food in a paper bag.",
            dialogue: [],
            vocabulary: [
                ReadingVocabularyItem(word: "cart", definition: "A large basket on wheels used in a store.", example: "She puts the vegetables in the cart.", icon: "cart.fill"),
                ReadingVocabularyItem(word: "shelf", definition: "A flat place where items are stored or displayed.", example: "The cereal is on the top shelf.", icon: "books.vertical.fill"),
                ReadingVocabularyItem(word: "receipt", definition: "A paper showing what you bought and how much you paid.", example: "Keep the receipt after you pay.", icon: "receipt.fill"),
                ReadingVocabularyItem(word: "bag", definition: "A container used to carry things.", example: "He carries the fruit in a paper bag.", icon: "bag.fill")
            ]
        )
    ]

    static let dialogueLessons: [ReadingLesson] = [
        ReadingLesson(
            kind: .dialogue,
            title: "At the Coffee Shop",
            subtitle: "A short dialogue between a customer and a barista.",
            icon: "cup.and.saucer.fill",
            level: "Beginner",
            duration: "3 min",
            content: "Barista: Hi, what would you like?\nMia: Can I have a coffee and a sandwich, please?\nBarista: Sure. Do you want a small or large coffee?\nMia: A small coffee, please.\nBarista: Anything else?\nMia: Yes, a bottle of water.\nBarista: No problem. Your total is eight dollars.\nMia: Here you go.\nBarista: Thank you. Your tray is on the counter.",
            dialogue: [
                ReadingDialogueLine(speaker: "Barista", message: "Hi, what would you like?"),
                ReadingDialogueLine(speaker: "Mia", message: "Can I have a coffee and a sandwich, please?"),
                ReadingDialogueLine(speaker: "Barista", message: "Sure. Do you want a small or large coffee?"),
                ReadingDialogueLine(speaker: "Mia", message: "A small coffee, please."),
                ReadingDialogueLine(speaker: "Barista", message: "Anything else?"),
                ReadingDialogueLine(speaker: "Mia", message: "Yes, a bottle of water."),
                ReadingDialogueLine(speaker: "Barista", message: "No problem. Your total is eight dollars."),
                ReadingDialogueLine(speaker: "Mia", message: "Here you go."),
                ReadingDialogueLine(speaker: "Barista", message: "Thank you. Your tray is on the counter.")
            ],
            vocabulary: [
                ReadingVocabularyItem(word: "sandwich", definition: "Food made with bread and something inside it.", example: "I ordered a sandwich for lunch.", icon: "birthday.cake"),
                ReadingVocabularyItem(word: "bottle", definition: "A container used for drinks.", example: "She bought a bottle of water.", icon: "waterbottle"),
                ReadingVocabularyItem(word: "tray", definition: "A flat object used to carry food or drinks.", example: "The cups are on the tray.", icon: "rectangle.on.rectangle")
            ]
        ),
        ReadingLesson(
            kind: .dialogue,
            title: "Looking for a Book",
            subtitle: "Two friends speak in a bookstore.",
            icon: "book.fill",
            level: "Beginner",
            duration: "4 min",
            content: "Lina: Excuse me, where is the travel section?\nClerk: It is next to the window, near the map stand.\nLina: Great, thank you. I need a guidebook for London.\nClerk: We have several on that shelf.\nNoah: Look, this book also comes with a small dictionary.\nLina: Nice. I think I will take this one.\nClerk: You can pay at the front desk.\nLina: Perfect, thanks for your help.",
            dialogue: [
                ReadingDialogueLine(speaker: "Lina", message: "Excuse me, where is the travel section?"),
                ReadingDialogueLine(speaker: "Clerk", message: "It is next to the window, near the map stand."),
                ReadingDialogueLine(speaker: "Lina", message: "Great, thank you. I need a guidebook for London."),
                ReadingDialogueLine(speaker: "Clerk", message: "We have several on that shelf."),
                ReadingDialogueLine(speaker: "Noah", message: "Look, this book also comes with a small dictionary."),
                ReadingDialogueLine(speaker: "Lina", message: "Nice. I think I will take this one."),
                ReadingDialogueLine(speaker: "Clerk", message: "You can pay at the front desk."),
                ReadingDialogueLine(speaker: "Lina", message: "Perfect, thanks for your help.")
            ],
            vocabulary: [
                ReadingVocabularyItem(word: "guidebook", definition: "A book with useful information about a place.", example: "This guidebook has many travel tips.", icon: "book.fill"),
                ReadingVocabularyItem(word: "shelf", definition: "A flat place where books or objects are kept.", example: "The new books are on the top shelf.", icon: "books.vertical.fill"),
                ReadingVocabularyItem(word: "desk", definition: "A table where someone works or helps customers.", example: "Please ask at the front desk.", icon: "table.furniture")
            ]
        ),
        ReadingLesson(
            kind: .dialogue,
            title: "In the Office",
            subtitle: "A practical work conversation between colleagues.",
            icon: "briefcase.fill",
            level: "Core",
            duration: "4 min",
            content: "Ethan: Do you have the file for the meeting?\nSara: Yes, it is on my laptop.\nEthan: Great. Can you also bring the charger?\nSara: Of course. I have the charger, my notebook, and a pen in my bag.\nEthan: Perfect. The manager is already in the conference room.\nSara: Okay, let’s go. I will put the papers on the table.\nEthan: Thanks. I will open the presentation on the screen.",
            dialogue: [
                ReadingDialogueLine(speaker: "Ethan", message: "Do you have the file for the meeting?"),
                ReadingDialogueLine(speaker: "Sara", message: "Yes, it is on my laptop."),
                ReadingDialogueLine(speaker: "Ethan", message: "Great. Can you also bring the charger?"),
                ReadingDialogueLine(speaker: "Sara", message: "Of course. I have the charger, my notebook, and a pen in my bag."),
                ReadingDialogueLine(speaker: "Ethan", message: "Perfect. The manager is already in the conference room."),
                ReadingDialogueLine(speaker: "Sara", message: "Okay, let’s go. I will put the papers on the table."),
                ReadingDialogueLine(speaker: "Ethan", message: "Thanks. I will open the presentation on the screen.")
            ],
            vocabulary: [
                ReadingVocabularyItem(word: "file", definition: "A document or set of documents stored together.", example: "Please send me the file before noon.", icon: "doc.fill"),
                ReadingVocabularyItem(word: "charger", definition: "A device or cable used to give power to a phone or laptop.", example: "My phone charger is in my backpack.", icon: "cable.connector"),
                ReadingVocabularyItem(word: "screen", definition: "The flat surface where you see images on a device.", example: "The presentation is on the screen.", icon: "display")
            ]
        )
    ]
}
