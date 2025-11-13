//
//  Date+Ext.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/13.
//
import Foundation

extension Date {
    func addingTimeInterval(days: Int = 0, hours: Int = 0, minutes: Int = 0) -> Date {
        let totalSeconds =
            (days * 86_400) +
            (hours * 3_600) +
            (minutes * 60)
        return self.addingTimeInterval(TimeInterval(totalSeconds))
    }
}
