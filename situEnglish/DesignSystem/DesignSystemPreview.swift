//
//  DesignSystemPreview.swift
//  situEnglish
//
//  Created by samatar barkadleh on 3/30/26.
//

import SwiftUI

struct DesignSystemPreview: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.Layout.xxl) {
                
                // MARK: - Headings
                VStack(alignment: .leading, spacing: Spacing.Layout.sm) {
                    AppText("Heading 1", style: .h1)
                    AppText("Heading 2", style: .h2)
                    AppText("Heading 3", style: .h3)
                }
                
                Divider()
                
                // MARK: - Body Text
                VStack(alignment: .leading, spacing: Spacing.Layout.sm) {
                    AppText("Body regular", style: .bodyText)
                    AppText("Body bold", style: .bodyBoldText)
                    AppText("Caption regular", style: .captionText, color: .appMutedForeground)
                    AppText("Caption bold", style: .captionBoldText, color: .appMutedForeground)
                }

                Divider()

                // MARK: - Text Fields
                DesignSystemTextFieldPreview()
                
                Divider()

                // MARK: - Icons
                VStack(alignment: .leading, spacing: Spacing.Layout.md) {
                    AppText("Icons", style: .bodyBoldText)

                    HStack(spacing: Spacing.Layout.lg) {
                        AppIcon(name: "star.fill", size: .sm)
                        AppIcon(name: "heart.fill", size: .md, color: .appSecondary)
                        AppIcon(name: "trash.fill", size: .lg, color: .appDestructive)
                    }
                }
                
                Divider()

                // MARK: - Badges
                VStack(alignment: .leading, spacing: Spacing.Layout.md) {
                    AppText("Badges", style: .bodyBoldText)

                    HStack(spacing: Spacing.Layout.sm) {
                        AppBadge("Beginner")
                        AppBadge("Grammar")
                        AppBadge("In Progress", variant: .primary)
                    }
                }
                
                Divider()
                
                // MARK: - Buttons
                VStack(alignment: .leading, spacing: Spacing.Layout.md) {
                    
                    AppText("Buttons - Text Only", style: .bodyBoldText)
                    
                    VStack(spacing: Spacing.Layout.sm) {
                        AppButton(variant: .primary, size: .small, width: .fit) { print("samatar")} content: { Text("Primary Small") }
                        AppButton(variant: .secondary, size: .medium) { } content: { Text("Secondary Medium") }
                        AppButton(variant: .destructive, size: .large) { } content: { Text("Destructive Large") }
                    }
                    
                    Divider()
                    
                    AppText("Buttons - Icon Only", style: .bodyBoldText)
                    
                    HStack(spacing: Spacing.Layout.sm) {
                        AppButton(variant: .primary, size: .medium, width: .fit) { } content: {
                            AppIcon(name: "star.fill")
                        }
                        AppButton(variant: .secondary, size: .medium, width: .fit) { } content: {
                            AppIcon(name: "heart.fill")
                        }
                        AppButton(variant: .destructive, size: .medium, width: .fit) { } content: {
                            AppIcon(name: "trash.fill")
                        }
                    }
                    
                    Divider()
                    
                    AppText("Buttons - Icon + Text", style: .bodyBoldText)
                    
                    VStack(spacing: Spacing.Layout.sm) {
                        AppButton(variant: .primary, size: .medium) { } content: {
                            HStack {
                                AppIcon(name: "star.fill")
                                Text("Primary Icon+Text")
                            }
                        }
                        AppButton(variant: .secondary, size: .medium) { } content: {
                            HStack {
                                AppIcon(name: "heart.fill")
                                Text("Secondary Icon+Text")
                            }
                        }
                        AppButton(variant: .destructive, size: .medium) { } content: {
                            HStack {
                                AppIcon(name: "trash.fill")
                                Text("Destructive Icon+Text")
                            }
                        }
                    }
                    
                    Divider()
                    
                    AppText("Buttons - Disabled / Loading", style: .bodyBoldText)
                    
                    VStack(spacing: Spacing.Layout.sm) {
                        AppButton(variant: .primary, size: .medium, isDisabled: true) { } content: {
                            Text("Disabled Primary")
                        }
                        AppButton(variant: .destructive, size: .medium, isLoading: true) { } content: {
                            Text("Loading Secondary")
                        }
                    }
                }

                Divider()

                // MARK: - Spinners
                VStack(alignment: .leading, spacing: Spacing.Layout.md) {
                    AppText("Spinners", style: .bodyBoldText)

                    HStack(spacing: Spacing.Layout.lg) {
                        AppSpinner()
                        AppSpinner(size: .medium, color: .appSecondary)
                        AppSpinner(size: .large, color: .appDestructive)
                    }
                }
            }
            .padding(Spacing.Layout.lg)
        }
        .background(Color.appBackground)
    }
}

private struct DesignSystemTextFieldPreview: View {
    @State private var email = ""
    @State private var password = ""
    @State private var invalidEmail = "wrong-email-format"

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText("Text Fields", style: .bodyBoldText)

            AppTextField(
                label: "Email",
                placeholder: "Enter your email",
                text: $email
            )

            AppTextField(
                label: "Password",
                placeholder: "Enter your password",
                text: $password,
                icon: "lock",
                isSecure: true
            )

            AppTextField(
                label: "Email",
                placeholder: "Enter your email",
                text: $invalidEmail,
                error: "Please enter a valid email address",
                icon: "envelope"
            )
        }
    }
}

// MARK: - Preview
struct DesignSystemPreview_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DesignSystemPreview()
                .preferredColorScheme(.light)
            
            DesignSystemPreview()
                .preferredColorScheme(.dark)
        }
    }
}
