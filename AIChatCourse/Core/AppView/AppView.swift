//
//  AppView.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/10/30.
//

import SwiftUI

struct AppView: View {
    
    @Environment(AuthManager.self) private var authManager
    @Environment(UserManager.self) private var userManager
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
        if let user = authManager.auth {
            // user is authenticated
            print("User is authenticated: \(user.uid)")
            
            do {
                try await userManager.login(auth: user, isNewUser: false)
            } catch {
                print("Failed to log in to auth for existing user: \(error)")
                try? await Task.sleep(for: .seconds(5))
                await checkUserState()
            }
            
        } else {
            // user is not authenticated
            do {
                let result = try await authManager.signInAnonymously()
                
                // login to app
                print("Sign in anonymous success: \(result.user.uid)")
                
                // log in
                try await userManager.login(auth: result.user, isNewUser: result.isNewUser)
                
            } catch {
                print("Failed to sign in anonymously and log in: \(error)")
                try? await Task.sleep(for: .seconds(5))
                await checkUserState()
            }
        }
    }
}

#Preview("AppView - tabbar") {
    AppView(appState: AppState(showTabBar: true))
        .environment(AuthManager(service: MockAuthService(user: .mock())))
        .environment(UserManager(service: MockUserService(user: .mock)))
}

#Preview("AppView - onboarding") {
    AppView(appState: AppState(showTabBar: false))
        .environment(AuthManager(service: MockAuthService(user: nil)))
        .environment(UserManager(service: MockUserService(user: nil)))
}

