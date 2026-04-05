import SwiftUI

struct AppTextStyle {
    let font: Font
    let lineSpacing: CGFloat
}

struct AppText: View {
    private let localizedContent: LocalizedStringKey?
    private let rawContent: String?
    let style: AppTextStyle
    let color: Color

    init(
        _ content: LocalizedStringKey,
        style: AppTextStyle,
        color: Color = .appForeground
    ) {
        self.localizedContent = content
        self.rawContent = nil
        self.style = style
        self.color = color
    }

    init(
        _ content: String,
        style: AppTextStyle,
        color: Color = .appForeground
    ) {
        self.localizedContent = nil
        self.rawContent = content
        self.style = style
        self.color = color
    }

    var body: some View {
        if let localizedContent {
            Text(localizedContent)
                .appStyle(style)
                .foregroundColor(color)
        } else if let rawContent {
            Text(rawContent)
                .appStyle(style)
                .foregroundColor(color)
        }
    }
}

extension AppTextStyle {
    static let h1 = AppTextStyle(
        font: .system(size: Spacing.TextSize.h1, weight: .bold),
        lineSpacing: Spacing.LineHeight.heading
    )

    static let h2 = AppTextStyle(
        font: .system(size: Spacing.TextSize.h2, weight: .medium),
        lineSpacing: Spacing.LineHeight.heading
    )

    static let h3 = AppTextStyle(
        font: .system(size: Spacing.TextSize.h3, weight: .medium),
        lineSpacing: Spacing.LineHeight.heading
    )

    static let bodyText = AppTextStyle(
        font: .system(size: Spacing.TextSize.body, weight: .regular),
        lineSpacing: Spacing.LineHeight.body
    )

    static let bodyBoldText = AppTextStyle(
        font: .system(size: Spacing.TextSize.body, weight: .medium),
        lineSpacing: Spacing.LineHeight.body
    )

    static let captionText = AppTextStyle(
        font: .system(size: Spacing.TextSize.caption, weight: .regular),
        lineSpacing: Spacing.LineHeight.caption
    )

    static let captionBoldText = AppTextStyle(
        font: .system(size: Spacing.TextSize.caption, weight: .medium),
        lineSpacing: Spacing.LineHeight.caption
    )

    static let buttonText = AppTextStyle(
        font: .system(size: Spacing.TextSize.body, weight: .bold),
        lineSpacing: Spacing.LineHeight.button
    )
}

extension Text {
    func appStyle(_ style: AppTextStyle) -> some View {
        self
            .font(style.font)
            .lineSpacing(style.lineSpacing)
    }
}
