//
//  Binding+Ext.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/26.
//

import SwiftUI
import Foundation

extension Binding where Value == Bool {
    init<T: Sendable>(ifNotNil value: Binding<T?>) {
        self.init(get: {
            value.wrappedValue != nil
        }, set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        })
    }
}

