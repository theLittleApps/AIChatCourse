//
//  ChatMessageModel.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/13.
//
import Foundation

struct ChatMessageModel: Identifiable {
    let id: String
    let chatId: String
    let authorId: String?
    let content: String?
    let seenByIds: [String]?
    let dateCreated: Date?
    
    init(
        id: String,
        chatId: String,
        authorId: String? = nil,
        content: String? = nil,
        seenByIds: [String]? = nil,
        dateCreated: Date? = nil
    ) {
        self.id = id
        self.chatId = chatId
        self.authorId = authorId
        self.content = content
        self.seenByIds = seenByIds
        self.dateCreated = dateCreated
    }
    
    func hasBeenSeenBy(userId: String) -> Bool {
        guard let seenByIds else { return false }
        return seenByIds.contains(userId)
    }
    
    static var mock: ChatMessageModel {
        mocks[0]
    }
    
    static var mocks: [ChatMessageModel] {
        let now = Date()
        return [
            ChatMessageModel(
                id: "msg_001",
                chatId: "chat_001",
                authorId: "user_001",
                content: "Hey! How’s everything going?",
                seenByIds: ["user_002", "user_003"],
                dateCreated: now.addingTimeInterval(minutes: -5)
            ),
            ChatMessageModel(
                id: "msg_002",
                chatId: "chat_001",
                authorId: "user_002",
                content: "All good here! How about you?",
                seenByIds: ["user_001", "user_003"],
                dateCreated: now.addingTimeInterval(minutes: -3)
            ),
            ChatMessageModel(
                id: "msg_003",
                chatId: "chat_002",
                authorId: "user_003",
                content: "Did you check the new design updates?",
                seenByIds: ["user_004"],
                dateCreated: now.addingTimeInterval(hours: -1)
            ),
            ChatMessageModel(
                id: "msg_004",
                chatId: "chat_003",
                authorId: "user_004",
                content: "Let’s schedule a meeting tomorrow morning.",
                seenByIds: [],
                dateCreated: now.addingTimeInterval(days: -1, hours: -2)
            )
        ]
    }
}
