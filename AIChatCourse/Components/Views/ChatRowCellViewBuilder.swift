//
//  ChatRowCellViewBuilder.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/14.
//

import SwiftUI

struct ChatRowCellViewBuilder: View {
    
    var currentUserId: String? = ""
    var chat: ChatModel = .mock
    var getAvatar: () async -> AvataModel?
    var getLastChatMessage: () async -> ChatMessageModel?
    
    @State private var avatar: AvataModel?
    @State private var lastChatMessage: ChatMessageModel?
    
    @State private var didLoadAvatar: Bool = false
    @State private var didLoadLastChatMessage: Bool = false
    
    private var isLoading: Bool {
        !(didLoadAvatar && didLoadLastChatMessage)
    }
    
    private var hasNewChat: Bool {
        guard let lastChatMessage, let currentUserId else {
            return false
        }
        return lastChatMessage.hasBeenSeenBy(userId: currentUserId)
    }
    
    private var subheadline: String? {
        if isLoading {
            return "xxx xxx xxx xxx xxx"
        }
        
        if avatar == nil && lastChatMessage == nil {
            return "Error"
        }
        
        return lastChatMessage?.content
    }
    
    var body: some View {
        ChatRowCellView(
            imageName: avatar?.profileImageName,
            headline: isLoading ? "xxx xxx" : avatar?.name,
            subheadline: subheadline,
            hasNewChat: isLoading ? false : hasNewChat
        )
        .redacted(reason: isLoading ? .placeholder : [])
        .task {
            // get the avatar
            avatar = await getAvatar()
            didLoadAvatar = true
        }
        .task {
            // get the last chat message
            lastChatMessage = await getLastChatMessage()
            didLoadLastChatMessage = true
        }
    }
}

#Preview {
    ChatRowCellViewBuilder(chat: .mock, getAvatar: {
        try? await Task.sleep(for: .seconds(5))
        return .mock
    }, getLastChatMessage: {
        try? await Task.sleep(for: .seconds(5))
        return .mock
    })
    
    ChatRowCellViewBuilder(chat: .mock, getAvatar: {
        .mock
    }, getLastChatMessage: {
        .mock
    })
    
    ChatRowCellViewBuilder(chat: .mock, getAvatar: {
        nil
    }, getLastChatMessage: {
        nil
    })
}
