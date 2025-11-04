//
//  ProfileView.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/3.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var showSettingView: Bool = false
    
    var body: some View {
        NavigationStack {
            Text("Profile")
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem {
                        settingButton
                    }
                }
        }
        .sheet(isPresented: $showSettingView) {
            SettingsView()
        }
    }
    
    private var settingButton: some View {
        Button {
            onSettingButtonPressed()
        } label: {
            Image(systemName: "gear")
                .font(.headline)
        }
    }
    
    private func onSettingButtonPressed() {
        showSettingView = true
    }
}

#Preview {
    ProfileView()
}
