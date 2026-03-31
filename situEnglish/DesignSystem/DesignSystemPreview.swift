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
                    Text("Heading 1")
                        .appStyle(.h1)
                        .foregroundColor(.appForeground)
                    
                    Text("Heading 2")
                        .appStyle(.h2)
                        .foregroundColor(.appForeground)
                    
                    Text("Heading 3")
                        .appStyle(.h3)
                        .foregroundColor(.appForeground)
                }
                
                Divider()
                
                // MARK: - Body Text
                VStack(alignment: .leading, spacing: Spacing.Layout.sm) {
                    Text("Body regular")
                        .appStyle(.bodyText)
                        .foregroundColor(.appForeground)
                    
                    Text("Body bold")
                        .appStyle(.bodyBoldText)
                        .foregroundColor(.appForeground)
                    
                    Text("Caption regular")
                        .appStyle(.captionText)
                        .foregroundColor(.appMutedForeground)
                    
                    Text("Caption bold")
                        .appStyle(.captionBoldText)
                        .foregroundColor(.appMutedForeground)
                }
                
                Divider()
                
                // MARK: - Buttons
                VStack(alignment: .leading, spacing: Spacing.Layout.md) {
                    
                    Text("Buttons - Text Only")
                        .appStyle(.bodyBoldText)
                    
                    VStack(spacing: Spacing.Layout.sm) {
                        AppButton(variant: .primary, size: .small, width: .fit) { print("samatar")} content: { Text("Primary Small") }
                        AppButton(variant: .secondary, size: .medium) { } content: { Text("Secondary Medium") }
                        AppButton(variant: .destructive, size: .large) { } content: { Text("Destructive Large") }
                    }
                    
                    Divider()
                    
                    Text("Buttons - Icon Only")
                        .appStyle(.bodyBoldText)
                    
                    HStack(spacing: Spacing.Layout.sm) {
                        AppButton(variant: .primary, size: .medium, width: .fit) { } content: {
                            Image(systemName: "star.fill")
                        }
                        AppButton(variant: .secondary, size: .medium, width: .fit) { } content: {
                            Image(systemName: "heart.fill")
                        }
                        AppButton(variant: .destructive, size: .medium, width: .fit) { } content: {
                            Image(systemName: "trash.fill")
                        }
                    }
                    
                    Divider()
                    
                    Text("Buttons - Icon + Text")
                        .appStyle(.bodyBoldText)
                    
                    VStack(spacing: Spacing.Layout.sm) {
                        AppButton(variant: .primary, size: .medium) { } content: {
                            HStack {
                                Image(systemName: "star.fill")
                                Text("Primary Icon+Text")
                            }
                        }
                        AppButton(variant: .secondary, size: .medium) { } content: {
                            HStack {
                                Image(systemName: "heart.fill")
                                Text("Secondary Icon+Text")
                            }
                        }
                        AppButton(variant: .destructive, size: .medium) { } content: {
                            HStack {
                                Image(systemName: "trash.fill")
                                Text("Destructive Icon+Text")
                            }
                        }
                    }
                    
                    Divider()
                    
                    Text("Buttons - Disabled / Loading")
                        .appStyle(.bodyBoldText)
                    
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
                    Text("Spinners")
                        .appStyle(.bodyBoldText)
                        .foregroundColor(.appForeground)

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
