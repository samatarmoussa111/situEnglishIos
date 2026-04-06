import SwiftUI

struct AppDialogueMessageCard: View {
    let speaker: String
    let message: String
    let isAccent: Bool

    init(
        speaker: String,
        message: String,
        isAccent: Bool = false
    ) {
        self.speaker = speaker
        self.message = message
        self.isAccent = isAccent
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.sm) {
            Text(speaker)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(isAccent ? .appSecondaryForeground : .appMutedForeground)
                .textCase(.uppercase)

            Text(message)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(isAccent ? .appSecondaryForeground : .appCardForeground)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(Spacing.Layout.lg)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(isAccent ? Color.appSecondary : Color.appCard)
        .overlay {
            RoundedRectangle(cornerRadius: Spacing.Radius.lg)
                .stroke(isAccent ? Color.clear : Color.appBorder.opacity(0.6), lineWidth: 1)
        }
        .clipShape(RoundedRectangle(cornerRadius: Spacing.Radius.lg))
    }
}
