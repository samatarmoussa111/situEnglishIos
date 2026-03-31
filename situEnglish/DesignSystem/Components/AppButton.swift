//
//  AppButton.swift
//  situEnglish
//
//  Created by Samatar Barkadleh on 3/30/26.
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
    let isDisabled: Bool
    let isLoading: Bool
    let action: () -> Void
    let content: () -> Content
    
    init(
        variant: AppButtonVariant = .primary,
        size: AppButtonSize = .medium,
        width: AppButtonWidth = .full,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        action: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.variant = variant
        self.size = size
        self.width = width
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.action = action
        self.content = content
    }
    
    var body: some View {
        Button(action: action) {
            ZStack {
                // Contenu normal
                content()
                    .opacity(isLoading ? 0 : 1)
                    .font(font)
                    .frame(maxWidth: width == .full ? .infinity : nil)
                    .padding(.vertical, verticalPadding)
                    .padding(.horizontal, horizontalPadding)
                
                // Loading
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: foregroundColor))
                }
            }
        }
        .disabled(isDisabled || isLoading)
        .background(backgroundColor)
        .foregroundColor(foregroundColor)
        .cornerRadius(Spacing.Radius.md)
    }
}

// MARK: - Styles
extension AppButton {
    
    private var backgroundColor: Color {
        switch variant {
        case .primary:
            return .appPrimary
        case .secondary:
            return .appSecondary
        case .destructive:
            return .appDestructive
        }
    }
    
    private var foregroundColor: Color {
        switch variant {
        case .primary:
            return .appPrimaryForeground
        case .secondary:
            return .appSecondaryForeground
        case .destructive:
            return .white
        }
    }
    
    private var font: Font {
        switch size {
        case .small:
            return .custom("Inter_18pt-Medium", size: 14)
        case .medium:
            return AppTextStyle.buttonText.font
        case .large:
            return .custom("Inter_18pt-Bold", size: 18)
        }
    }
    
    private var verticalPadding: CGFloat {
        switch size {
        case .small: return Spacing.Layout.sm
        case .medium: return Spacing.Layout.md
        case .large: return Spacing.Layout.lg
        }
    }
    
    private var horizontalPadding: CGFloat {
        switch size {
        case .small: return Spacing.Layout.md
        case .medium: return Spacing.Layout.lg
        case .large: return Spacing.Layout.xl
        }
    }
}
