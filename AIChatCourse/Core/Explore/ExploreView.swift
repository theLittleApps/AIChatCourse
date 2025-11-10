//
//  ExploreView.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/3.
//

import SwiftUI

struct ExploreView: View {
    
    let avata = AvataModel.mock
    
    var body: some View {
        NavigationStack {
            HeroCellView(
                title: avata.name,
                subtitle: avata.characterDescription,
                imageName: avata.profileImageName
            )
            .frame(height: 200)
            .navigationTitle("Explore")
        }
    }
}

#Preview {
    ExploreView()
}
