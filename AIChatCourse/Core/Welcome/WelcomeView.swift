//
//  WelcomeView.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/3.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome")
                    .frame(maxHeight: .infinity)
                
                NavigationLink {
                    OnboardingCompletedView()
                } label: {
                    Text("Get Started")
                        .callToActionButton()
                        
                }
            }
            .padding(16)
        }
    }
}

#Preview {
    WelcomeView()
}
