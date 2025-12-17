//
//  UserAuthInfo+Firebase.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/12/16.
//

import FirebaseAuth

extension UserAuthInfo {
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.isAnonymous = user.isAnonymous
        self.creationDate = user.metadata.creationDate
        self.lastSignInDate = user.metadata.lastSignInDate
    }
    
}
