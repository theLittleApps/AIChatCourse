//
//  TextValidationHelper.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/25.
//

import Foundation

struct TextValidationHelper {
    enum TextValidationError: LocalizedError {
        case notEnoughCharacters(min: Int)
        case hasBadWords
        
        var errorDescription: String? {
            switch self {
            case .notEnoughCharacters(min: let min):
                return "Please add at least \(min) characters."
            case .hasBadWords:
                return "Bad words detected. Please rephrase your message."
            }
        }
    }

    static func checkIfTextIsValid(text: String) throws {
        let minimumCharacterCount = 4
        
        guard text.count >= minimumCharacterCount else {
            throw TextValidationError.notEnoughCharacters(min: minimumCharacterCount)
        }
        
        let badWords: [String] = [
            "shit", "bitch", "ass"
        ]
        
        if badWords.contains(text.lowercased()) {
            throw TextValidationError.hasBadWords
        }
    }

    
}
