//
//  View+Ext.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/4.
//

import SwiftUI

extension View {
    func callToActionButton() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55.0)
            .background(.accent)
            .cornerRadius(16)
    }
}
