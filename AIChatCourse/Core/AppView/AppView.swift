//
//  AppView.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/10/30.
//

import SwiftUI

struct AppView: View {
    
    @Environment(\.authService) private var authService
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
        .task {
            await checkUserState()
        }
        .onChange(of: appState.showTabBar) { _, showTabBar in
            if !showTabBar {
                Task {
                    await checkUserState()
                }
            }
        }
    }
    
    private func checkUserState() async {
        if let user = authService.getAuthenticatedUser() {
            // user is authenticated
            print("User is authenticated: \(user.uid)")
        } else {
            // user is not authenticated
            do {
                let result = try await authService.signInAnonymously()
                
                // login to app
                print("Sign in anonymous success: \(result.user.uid)")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview("AppView - tabbar") {
    AppView(appState: AppState(showTabBar: true))
}

#Preview("AppView - onboarding") {
    AppView(appState: AppState(showTabBar: false))
}

