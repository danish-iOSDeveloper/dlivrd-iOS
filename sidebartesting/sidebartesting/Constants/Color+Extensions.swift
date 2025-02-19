//
//  Color+Extensions.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 18/02/2025.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        // Clean the hex string
        var cleanedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if cleanedHex.hasPrefix("#") {
            cleanedHex.removeFirst()
        }
        
        // Default to black if the hex is not valid
        guard cleanedHex.count == 6 else {
            self.init(red: 0, green: 0, blue: 0)
            return
        }
        
        // Extract RGB components from the hex
        let scanner = Scanner(string: cleanedHex)
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

//MARK: All the usable colors will be defined here
let acceptedOrderBgColor = Color(hex: "#EAFDE7")
let offeredOrderBgColor = Color(hex: "#EDEDED")
let acceptedtextColor = Color(hex: "#1BA620")
let loginButtonBgColor = Color(hex: "#50F839")

