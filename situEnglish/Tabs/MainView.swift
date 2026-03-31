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
                        HomeScreen()
                    case .vocabulary:
                        DesignSystemPreview()
                    case .reading:
                        Text("Reading Screen")
                    case .grammar:
                        Text("Grammar Screen")
                    case .tenses:
                        Text("Tenses Screen")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // 🔥 TAB BAR
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
    }
}

