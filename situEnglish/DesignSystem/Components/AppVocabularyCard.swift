import SwiftUI

struct AppVocabularyCard: View {
    let word: String
    let definition: String

    init(
        word: String,
        definition: String
    ) {
        self.word = word
        self.definition = definition
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.sm) {
            Text(word)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.appCardForeground)

            Text(definition)
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(.appMutedForeground)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(Spacing.Layout.lg)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.appCard)
        .overlay {
            RoundedRectangle(cornerRadius: Spacing.Radius.lg)
                .stroke(Color.appBorder.opacity(0.6), lineWidth: 1)
        }
        .clipShape(RoundedRectangle(cornerRadius: Spacing.Radius.lg))
    }
}
