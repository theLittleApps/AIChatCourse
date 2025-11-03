//
//  AppView.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/10/30.
//

import SwiftUI

// tabbar - signed in
// onboarding - signed out

struct AppView: View {
    
    @AppStorage("showTabbarView") var showTabBar: Bool = false
    
    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabbarView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("Tabbar")
                }
            },
            onboardingView: {
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Onboarding")
                }
            }
        )
    }
}

#Preview("AppView - tabbar") {
    AppView(showTabBar: true)
}

#Preview("AppView - onboarding") {
    AppView(showTabBar: false)
}

