//
//  CustomTabView.swift
//  situEnglish
//
//  Created by samatar barkadleh on 3/31/26.
//


import SwiftUI

enum Tab: String, CaseIterable {
    case home
    case vocabulary
    case reading
    case grammar
    case tenses
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .vocabulary: return "Vocab"
        case .reading: return "Reading"
        case .grammar: return "Grammar"
        case .tenses: return "Tenses"
        }
    }
    
    var icon: String {
        switch self {
        case .home: return "house"
        case .vocabulary: return "book"
        case .reading: return "doc.text"
        case .grammar: return "textformat"
        case .tenses: return "clock"
        }
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        selectedTab = tab
                    }
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: tab.icon)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text(tab.title)
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == tab ? Color.appPrimary : Color.appSecondary)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.08), radius: 10, y: 5)
        )
        .padding(.horizontal)
    }
}
