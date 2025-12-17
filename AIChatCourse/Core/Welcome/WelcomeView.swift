//
//  WelcomeView.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/3.
//

import SwiftUI

struct WelcomeView: View {
    
    @Environment(AppState.self) private var root
    
    @State var imageName: String = Constants.randomImage
    @State private var showSignInView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8.0) {
                ImageLoaderView(urlString: imageName)
                    .ignoresSafeArea()
                
                titleSection
                    .padding(.top, 24.0)
                
                callToAcitions
                    .padding(16)
                
                policyLinks
            }
        }
        .sheet(isPresented: $showSignInView) {
            CreateAccountView(
                title: "Sign in",
                subtitle: "Connect to an existing account.",
                onDidSignIn: { isNewUser in
                    handleDidSignIn(isNewUser: isNewUser)
                }
            )
            .presentationDetents([.medium])
        }
    }
    
    private var titleSection: some View {
        VStack {
            Text("AI Chat 🖖🏻")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("https://thelittleapps.com")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
    
    private var callToAcitions: some View {
        VStack(spacing: 8.0) {
            NavigationLink {
                OnboardingIntroView()
            } label: {
                Text("Get Started")
                    .callToActionButton()
                    
            }
            
            Text("Already have an account? Sign in.")
                .underline()
                .font(.body)
                .padding(8)
                .tappableBackground()
                .onTapGesture {
                    onSignInPressed()
                }
        }
    }
    
    private var policyLinks: some View {
        HStack(spacing: 8) {
            Link(destination: URL(string: Constants.termsOfServiceUrl)!) {
                Text("Terms of Service")
            }
            
            Circle()
                .fill(.accent)
                .frame(width: 4, height: 4)
            
            Link(destination: URL(string: Constants.privacyPolicyUrl)!) {
                Text("Privacy Policy")
            }
        }
    }
    
    private func handleDidSignIn(isNewUser: Bool) {
        if isNewUser {
            // Do nothing, user goes through onboarding
        } else {
            // Push into tabbar view
            root.updateViewState(showTabBarView: true)
        }
    }
    
    private func onSignInPressed() {
        showSignInView = true
    }
}

#Preview {
    WelcomeView()
}
