//
//  ChatModel.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/13.
//
import Foundation

struct ChatModel: Identifiable {
    let id: String
    let userId: String
    let avatarId: String
    let dateCreated: Date
    let dateModified: Date
    
    static var mock: ChatModel {
        mocks[0]
    }
    
    static var mocks: [ChatModel] {
        let now = Date()
        return [
            ChatModel(
                id: "chat_001",
                userId: "user_001",
                avatarId: "avatar_01",
                dateCreated: now.addingTimeInterval(hours: -1),
                dateModified: now.addingTimeInterval(minutes: -50)
            ),
            ChatModel(
                id: "chat_002",
                userId: "user_002",
                avatarId: "avatar_02",
                dateCreated: now.addingTimeInterval(hours: -2),
                dateModified: now.addingTimeInterval(hours: -1, minutes: -55)
            ),
            ChatModel(
                id: "chat_003",
                userId: "user_003",
                avatarId: "avatar_03",
                dateCreated: now.addingTimeInterval(hours: -3),
                dateModified: now.addingTimeInterval(hours: -2, minutes: -50)
            ),
            ChatModel(
                id: "chat_004",
                userId: "user_004",
                avatarId: "avatar_04",
                dateCreated: now.addingTimeInterval(days: -1, hours: -4),
                dateModified: now.addingTimeInterval(days: -1, hours: -3, minutes: -40)
            )
        ]
    }
}
