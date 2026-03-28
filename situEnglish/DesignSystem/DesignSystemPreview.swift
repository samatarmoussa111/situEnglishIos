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
                VStack(spacing: Spacing.Layout.md) {
                    Button("Primary Button") {}
                        .font(AppTextStyle.buttonText.font)
                        .padding(Spacing.Layout.md)
                        .frame(maxWidth: .infinity)
                        .background(Color.appPrimary)
                        .foregroundColor(Color.appPrimaryForeground)
                        .cornerRadius(10)
                    
                    Button("Secondary Button") {}
                        .font(AppTextStyle.buttonText.font)
                        .padding(Spacing.Layout.md)
                        .frame(maxWidth: .infinity)
                        .background(Color.appSecondary)
                        .foregroundColor(Color.appSecondaryForeground)
                        .cornerRadius(10)
                }
                
                Divider()
                
                // MARK: - Colors
                VStack(alignment: .leading, spacing: Spacing.Layout.sm) {
                    ColorRow(name: "Primary", color: .appPrimary)
                    ColorRow(name: "Background", color: .appBackground)
                    ColorRow(name: "Foreground", color: .appForeground)
                    ColorRow(name: "Secondary", color: .appSecondary)
                    ColorRow(name: "Muted", color: .appMuted)
                    ColorRow(name: "Accent", color: .appAccent)
                    ColorRow(name: "Destructive", color: .appDestructive)
                    ColorRow(name: "Border", color: .appBorder)
                    ColorRow(name: "Input", color: .appInput)
                    ColorRow(name: "Ring", color: .appRing)
                }
            }
            .padding(Spacing.Layout.lg)
        }
        .background(Color.appBackground)
    }
}

// MARK: - Color Row
struct ColorRow: View {
    let name: String
    let color: Color
    
    var body: some View {
        HStack(spacing: Spacing.Layout.md) {
            Text(name)
                .frame(width: 140, alignment: .leading)
                .foregroundColor(.appForeground)
            
            Rectangle()
                .fill(color)
                .frame(height: 30)
                .cornerRadius(6)
            
            Spacer()
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
