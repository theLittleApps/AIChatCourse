//
//  OnboardingCompletedView.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/4.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @Environment(AppState.self) private var root
    @Environment(UserManager.self) private var userManager
    
    @State private var isCompletingProfileSetup: Bool = false
    
    var selectedColor: Color = .orange
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Setup complete!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)
            
            Text("We've setup your profile and you are ready to start chatting.")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom, content: {
            AsyncCallToActionButton(
                isLoading: isCompletingProfileSetup,
                title: "Finish",
                action: onFinishButtonPressed
            )
        })
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func onFinishButtonPressed() {
        isCompletingProfileSetup = true
        Task {
            let hex = selectedColor.asHex()
            try await userManager.markOnboardingCompleteForCurrentUser(profileColorHex: hex)
            
            isCompletingProfileSetup = false
//            try await saveUserProfile(selectedColor: selectedColor)
            
            // other logic to complete onboarding
            root.updateViewState(showTabBarView: true)
        }
    }
}

#Preview {
    OnboardingCompletedView(selectedColor: .mint)
        .environment(UserManager(service: MockUserService()))
        .environment(AppState())
}
