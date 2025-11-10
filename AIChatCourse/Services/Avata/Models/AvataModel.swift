//
//  AvataModel.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/10.
//
import Foundation

struct AvataModel: Hashable {
    
    let avataId: String
    let name: String?
    let characterOption: CharacterOption?
    let characterAction: CharacterAction?
    let characterLocation: CharacterLocation?
    let profileImageName: String?
    let authorId: String?
    let dateCreated: Date?
    
    init(
        avataId: String,
        name: String? = nil,
        characterOption: CharacterOption? = nil,
        characterAction: CharacterAction? = nil,
        characterLocation: CharacterLocation? = nil,
        profileImageName: String? = nil,
        authorId: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.avataId = avataId
        self.name = name
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
        self.profileImageName = profileImageName
        self.authorId = authorId
        self.dateCreated = dateCreated
    }
    
    var characterDescription: String {
        AvataDescriptionBuilder(avata: self).characterDescription
    }
    
    static var mock: AvataModel {
        mocks[0]
    }
    
    static var mocks: [AvataModel] {
        [
            AvataModel(avataId: UUID().uuidString, name: "Alpha", characterOption: .alien, characterAction: .smiling, characterLocation: .park, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
            AvataModel(avataId: UUID().uuidString, name: "Beta", characterOption: .dog, characterAction: .eating, characterLocation: .forest, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
            AvataModel(avataId: UUID().uuidString, name: "Gamma", characterOption: .cat, characterAction: .drinking, characterLocation: .museum, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
            AvataModel(avataId: UUID().uuidString, name: "Delta", characterOption: .woman, characterAction: .shopping, characterLocation: .mall, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now)
        ]
    }
}

struct AvataDescriptionBuilder {
    let characterOption: CharacterOption
    let characterAction: CharacterAction
    let characterLocation: CharacterLocation
    
    init(characterOption: CharacterOption, characterAction: CharacterAction, characterLocation: CharacterLocation) {
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
    }
    
    init(avata: AvataModel) {
        self.characterOption = avata.characterOption ?? .default
        self.characterAction = avata.characterAction ?? .default
        self.characterLocation = avata.characterLocation ?? .desert
    }
    
    var characterDescription: String {
        "A \(characterOption.rawValue) that is \(characterAction.rawValue) in the \(characterLocation.rawValue)."
    }
}

enum CharacterOption: String {
    case man, woman, alien, dog, cat
    
    static var `default`: Self {
        .man
    }
}

enum CharacterAction: String {
    case smiling, sitting, eating, drinking, walking, shopping, studying, working, relaxing, fighting, crying
    
    static var `default`: Self {
        .smiling
    }
}

enum CharacterLocation: String {
    case park, mall, museum, city, desert, forest, space
    
    static var `default`: Self {
        .park
    }
}
