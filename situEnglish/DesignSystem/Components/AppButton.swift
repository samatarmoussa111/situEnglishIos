//
//  AppButton.swift
//  situEnglish
//

import SwiftUI

enum AppButtonVariant {
    case primary
    case secondary
    case destructive
}

enum AppButtonSize {
    case small
    case medium
    case large
}

enum AppButtonWidth {
    case full, fit
}

struct AppButton<Content: View>: View {
    let variant: AppButtonVariant
    let size: AppButtonSize
    let width: AppButtonWidth
    let isIconOnly: Bool
    let isDisabled: Bool
    let isLoading: Bool
    let action: (() -> Void)?   // ✅ OPTIONNEL
    let content: () -> Content
    
    init(
        variant: AppButtonVariant = .primary,
        size: AppButtonSize = .medium,
        width: AppButtonWidth = .full,
        isIconOnly: Bool = false,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        action: (() -> Void)? = nil,   // ✅ optionnel
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.variant = variant
        self.size = size
        self.width = width
        self.isIconOnly = isIconOnly
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.action = action
        self.content = content
    }
    
    var body: some View {
        Group {
            if let action = action {
                Button(action: action) {
                    buttonContent
                }
                .disabled(isDisabled || isLoading)
            } else {
                // ✅ Utilisé dans NavigationLink
                buttonContent
            }
        }
    }
}

// MARK: - UI
extension AppButton {
    private var buttonContent: some View {
        ZStack {
            content()
                .opacity(isLoading ? 0 : 1)
                .font(font)
                .frame(maxWidth: width == .full ? .infinity : nil)
                .frame(minWidth: isIconOnly ? iconButtonSide : (width == .fit ? controlHeight : nil))
                .frame(minHeight: isIconOnly ? iconButtonSide : controlHeight)
                .padding(.vertical, verticalPadding)
                .padding(.horizontal, horizontalPadding)
                .environment(\.appButtonIconSize, buttonIconSize)
            
            if isLoading {
                AppSpinner(size: .small, color: foregroundColor)
            }
        }
        .background(backgroundColor)
        .foregroundColor(foregroundColor)
        .overlay {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(borderColor, lineWidth: borderWidth)
        }
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .shadow(
            color: shadowColor,
            radius: shadowRadius,
            x: 0,
            y: shadowY
        )
        .opacity(isDisabled ? 0.55 : 1)
    }
}

// MARK: - Styles
extension AppButton {
    private var backgroundColor: Color {
        if isIconOnly {
            switch variant {
            case .primary:
                return .appPrimary
            case .secondary:
                return .appSecondary
            case .destructive:
                return Color.appDestructive.opacity(0.14)
            }
        }

        switch variant {
        case .primary:
            return .appPrimary
        case .secondary:
            return .appCard
        case .destructive:
            return .appDestructive
        }
    }

    private var foregroundColor: Color {
        if isIconOnly {
            switch variant {
            case .primary:
                return .appPrimaryForeground
            case .secondary:
                return .appSecondaryForeground
            case .destructive:
                return .appDestructive
            }
        }

        switch variant {
        case .primary:
            return .appPrimaryForeground
        case .secondary:
            return .appForeground
        case .destructive:
            return .white
        }
    }

    private var borderColor: Color {
        if isIconOnly {
            return .clear
        }

        switch variant {
        case .primary:
            return .clear
        case .secondary:
            return .appBorder
        case .destructive:
            return .clear
        }
    }

    private var borderWidth: CGFloat {
        if isIconOnly {
            return 0
        }
        return variant == .secondary ? 1 : 0
    }

    private var shadowColor: Color {
        if isIconOnly {
            return .clear
        }

        switch variant {
        case .primary:
            return Color.black.opacity(isDisabled ? 0 : 0.04)
        case .secondary, .destructive:
            return .clear
        }
    }

    private var shadowRadius: CGFloat {
        if isIconOnly {
            return 0
        }
        return variant == .primary ? 8 : 0
    }

    private var shadowY: CGFloat {
        if isIconOnly {
            return 0
        }
        return variant == .primary ? 3 : 0
    }

    private var cornerRadius: CGFloat {
        if isIconOnly {
            return Spacing.Radius.md
        }
        switch size {
        case .small:
            return Spacing.Radius.md
        case .medium:
            return Spacing.Radius.lg
        case .large:
            return 18
        }
    }

    private var font: Font {
        switch size {
        case .small:
            return .system(size: 13, weight: .medium)
        case .medium:
            return .system(size: 15, weight: .medium)
        case .large:
            return .system(size: 16, weight: .semibold)
        }
    }

    private var controlHeight: CGFloat {
        switch size {
        case .small:
            return 32
        case .medium:
            return 42
        case .large:
            return 48
        }
    }

    private var verticalPadding: CGFloat {
        if isIconOnly {
            return 0
        }
        switch size {
        case .small: return 0
        case .medium: return 0
        case .large: return 0
        }
    }

    private var horizontalPadding: CGFloat {
        if isIconOnly {
            return 0
        }
        switch size {
        case .small: return 12
        case .medium: return 16
        case .large: return 18
        }
    }

    private var buttonIconSize: Spacing.IconSize {
        if isIconOnly {
            switch size {
            case .small:
                return .sm
            case .medium:
                return .md
            case .large:
                return .md
            }
        }

        switch size {
        case .small:
            return .sm
        case .medium:
            return .sm
        case .large:
            return .md
        }
    }

    private var iconButtonSide: CGFloat {
        switch size {
        case .small:
            return 36
        case .medium:
            return 44
        case .large:
            return 48
        }
    }
}
