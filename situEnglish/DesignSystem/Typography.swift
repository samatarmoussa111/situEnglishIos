import SwiftUI

// MARK: - Text Style (Font + LineHeight)
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

// MARK: - All Text Styles
extension AppTextStyle {
    
    // MARK: - Headings
    static let h1 = AppTextStyle(
        font: .custom("Inter18pt-Bold", size: Spacing.TextSize.h1),
        lineSpacing: Spacing.LineHeight.heading
    )
    
    static let h2 = AppTextStyle(
        font: .custom("Inter18pt-Medium", size: Spacing.TextSize.h2),
        lineSpacing: Spacing.LineHeight.heading
    )
    
    static let h3 = AppTextStyle(
        font: .custom("Inter18pt-Medium", size: Spacing.TextSize.h3),
        lineSpacing: Spacing.LineHeight.heading
    )
    
    // MARK: - Body
    static let bodyText = AppTextStyle(
        font: .custom("Inter18pt-Regular", size: Spacing.TextSize.body),
        lineSpacing: Spacing.LineHeight.body
    )
    
    static let bodyBoldText = AppTextStyle(
        font: .custom("Inter18pt-Medium", size: Spacing.TextSize.body),
        lineSpacing: Spacing.LineHeight.body
    )
    
    // MARK: - Caption
    static let captionText = AppTextStyle(
        font: .custom("Inter18pt-Regular", size: Spacing.TextSize.caption),
        lineSpacing: Spacing.LineHeight.caption
    )
    
    static let captionBoldText = AppTextStyle(
        font: .custom("Inter18pt-Medium", size: Spacing.TextSize.caption),
        lineSpacing: Spacing.LineHeight.caption
    )
    
    // MARK: - Button
    static let buttonText = AppTextStyle(
        font: .custom("Inter18pt-Bold", size: Spacing.TextSize.body),
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
