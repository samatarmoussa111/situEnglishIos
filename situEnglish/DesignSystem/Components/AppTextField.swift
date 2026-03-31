//
//  AppTextField.swift
//  situEnglish
//
//  Created by Codex on 3/30/26.
//

import SwiftUI

struct AppTextField: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    let error: String?
    let icon: String?
    let isSecure: Bool

    @FocusState private var isFocused: Bool

    init(
        label: String,
        placeholder: String,
        text: Binding<String>,
        error: String? = nil,
        icon: String? = nil,
        isSecure: Bool = false
    ) {
        self.label = label
        self.placeholder = placeholder
        self._text = text
        self.error = error
        self.icon = icon
        self.isSecure = isSecure
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.sm) {
            AppText(label, style: .captionBoldText)

            HStack(spacing: Spacing.Layout.md) {
                if let icon {
                    Image(systemName: icon)
                        .foregroundColor(iconColor)
                }

                if isSecure {
                    SecureField(
                        "",
                        text: $text,
                        prompt: Text(placeholder)
                            .font(AppTextStyle.bodyText.font)
                            .foregroundColor(.appMutedForeground)
                    )
                    .focused($isFocused)
                    .font(AppTextStyle.bodyText.font)
                    .foregroundColor(.appForeground)
                } else {
                    TextField(
                        "",
                        text: $text,
                        prompt: Text(placeholder)
                            .font(AppTextStyle.bodyText.font)
                            .foregroundColor(.appMutedForeground)
                    )
                    .focused($isFocused)
                    .font(AppTextStyle.bodyText.font)
                    .foregroundColor(.appForeground)
                }
            }
            .padding(.horizontal, Spacing.Layout.lg)
            .padding(.vertical, Spacing.Layout.md)
            .background(Color.appInput)
            .overlay(
                RoundedRectangle(cornerRadius: Spacing.Radius.md)
                    .stroke(borderColor, lineWidth: isFocused ? 2 : 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: Spacing.Radius.md))

            if let error, !error.isEmpty {
                AppText(error, style: .captionText, color: .appDestructive)
            }
        }
    }
}

private extension AppTextField {
    var borderColor: Color {
        if let error, !error.isEmpty {
            return .appDestructive
        }

        return isFocused ? .appRing : .appBorder
    }

    var iconColor: Color {
        if let error, !error.isEmpty {
            return .appDestructive
        }

        return isFocused ? .appRing : .appMutedForeground
    }
}
