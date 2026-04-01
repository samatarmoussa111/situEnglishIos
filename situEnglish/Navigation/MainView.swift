//
//  BottomTabNav.swift
//  situEnglish
//
//  Created by samatar barkadleh on 3/31/26.
//


import SwiftUI

struct MainView: View {
    
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()

            VStack(spacing: 0) {
                
                // 🔥 CONTENU
                Group {
                    switch selectedTab {
                    case .home:
                        HomeStack()
                    case .vocabulary:
                        VocabularyStack()
                    case .reading:
                        ReadingStack()
                    case .grammar:
                        GrammarStack()
                    case .tenses:
                        TensesStack()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // 🔥 TAB BAR
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
    }
}

