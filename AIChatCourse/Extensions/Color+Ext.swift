//
//  Color+Ext.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/17.
//

import SwiftUI

extension Color {
    
    /// Initialize Color from hex string like "#FFAA00" or "FFAA00"
    init(hex: String) {
        let cleaned = hex
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")
        
        var hexString = cleaned
        
        // Expand shorthand "FA0" -> "FFAA00"
        if cleaned.count == 3 {
            hexString = cleaned.map { "\($0)\($0)" }.joined()
        }
        
        var int: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&int)
        
        let red, green, blue: Double
        red = Double((int >> 16) & 0xFF) / 255.0
        green = Double((int >> 8) & 0xFF) / 255.0
        blue = Double(int & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
    
    /// Convert Color to "#RRGGBB" hex string
    func toHex() -> String? {
        #if os(iOS)
        let uiColor = UIColor(self)
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        guard uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }
        
        let RED = Int(red * 255)
        let GREEN = Int(green * 255)
        let BLUE = Int(blue * 255)
        
        return String(format: "#%02X%02X%02X", RED, GREEN, BLUE)
        #else
        return nil
        #endif
    }
}
