//
//  OnboardingIntroView.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/5.
//

import SwiftUI

struct OnboardingIntroView: View {
    var body: some View {
        VStack {
            Group {
                Text("Make your own ")
                +
                Text("avatas ")
                    .foregroundStyle(.accent)
                    .fontWeight(.semibold)
                +
                Text("and chat with them!\n\nHave ")
                +
                Text("real conversation ")
                    .foregroundStyle(.accent)
                    .fontWeight(.semibold)
                +
                Text("with AI generated responses.")
            }
            .frame(maxHeight: .infinity)
        }
        .baselineOffset(6)
        .font(.title3)
        .padding(24)
        
        NavigationLink {
            OnboardingColorView()
        } label: {
            Text("Continue")
                .callToActionButton()
        }
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        OnboardingIntroView()
    }
    .environment(AppState())
}
