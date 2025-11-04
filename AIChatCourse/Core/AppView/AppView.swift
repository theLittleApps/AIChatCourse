//
//  AppView.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/10/30.
//

import SwiftUI

struct AppView: View {
    @State var appState: AppState = AppState()
    
    var body: some View {
        AppViewBuilder(
            showTabBar: appState.showTabBar,
            tabbarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .environment(appState)
    }
}

#Preview("AppView - tabbar") {
    AppView(appState: AppState(showTabBar: true))
}

#Preview("AppView - onboarding") {
    AppView(appState: AppState(showTabBar: false))
}

