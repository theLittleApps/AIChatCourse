//
//  AsyncCallToActionButton.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/21.
//

import SwiftUI

struct AsyncCallToActionButton: View {
    
    var isLoading: Bool = false
    var title: String = "Save"
    var action: () -> Void
    
    var body: some View {
        ZStack {
             if isLoading {
                 ProgressView()
                     .tint(.white)
             } else {
                 Text(title)
             }
        }
        .callToActionButton()
        .anyButton(.press) {
            // finish onboarding and enter app
            action()
        }
        .disabled(isLoading)
    }
}

private struct PreviewView: View {
    
    @State var isLoading: Bool = false
    
    var body: some View {
        AsyncCallToActionButton(
            isLoading: isLoading,
            title: "Finish") {
                isLoading = true
                
                Task {
                    try? await Task.sleep(for: .seconds(3))
                    isLoading = false
                }
            }
    }
}

#Preview {
    PreviewView()
        .padding()
}
