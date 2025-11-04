//
//  OnboardingCompletedView.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/4.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @Environment(AppState.self) private var root
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Onboarding completed")
                    .frame(maxHeight: .infinity)
                
                Button {
                    // finish onboarding and enter app
                    onFinishButtonPressed()
                } label: {
                    Text("Finish")
                        .callToActionButton()
                }
            }
            .padding(16)
        }
    }
    
    private func onFinishButtonPressed() {
        // other logic to complete onboarding
        root.updateViewState(showTabBarView: true)
    }
}

#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}
