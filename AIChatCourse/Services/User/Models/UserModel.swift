//
//  UserModel.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/17.
//

import Foundation
import SwiftUI

struct UserModel {
    
    let userId: String
    let dateCreated: Date?
    let didCompleteOnboarding: Bool?
    let profileColorHex: String?
    
    init(
        userId: String,
        dateCreated: Date? = nil,
        didCompleteOnboarding: Bool? = nil,
        profileColorHex: String? = nil
    ) {
        self.userId = userId
        self.dateCreated = dateCreated
        self.didCompleteOnboarding = didCompleteOnboarding
        self.profileColorHex = profileColorHex
    }
    
    var profileColorCalculated: Color {
        guard let profileColorHex else {
            return .accent
        }
        return Color(hex: profileColorHex)
    }
    
    static var mock: Self {
        mocks[0]
    }
    
    static var mocks: [Self] {
        let now = Date()
        return [
            UserModel(
                userId: "user_001",
                dateCreated: now,
                didCompleteOnboarding: true,
                profileColorHex: "#33A1FF"
            ),
            UserModel(
                userId: "user_002",
                dateCreated: now.addingTimeInterval(days: -1),
                didCompleteOnboarding: false,
                profileColorHex: "#7AC9FF"
            ),
            UserModel(
                userId: "user_003",
                dateCreated: now.addingTimeInterval(days: -3, hours: -2),
                didCompleteOnboarding: true,
                profileColorHex: "#A77AFF"
            ),
            UserModel(
                userId: "user_004",
                dateCreated: now.addingTimeInterval(days: -5, hours: -4),
                didCompleteOnboarding: false,
                profileColorHex: "#7AFFB2"
            )
        ]
    }
}
