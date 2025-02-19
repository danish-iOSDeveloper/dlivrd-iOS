//
//  ViewModifiers + Extensions.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 19/02/2025.
//

import Foundation
import SwiftUI

struct FontModifier: ViewModifier {
    var fontFamily: String
    var fontSize: CGFloat
    var fontWeight: Font.Weight
    var fontColor: Color
    func body(content: Content) -> some View {
        content
            .font(.custom(fontFamily, size: fontSize))
            .fontWeight(fontWeight)
            .foregroundStyle(fontColor)
    }
}
extension View {
    func textDecoration(family: String =  "Poppins", size: CGFloat = 12, fontWeight: Font.Weight = .regular, color: Color = .black) -> some View {
        self.modifier(FontModifier(fontFamily: family, fontSize: size, fontWeight: fontWeight, fontColor: color))
    }
}
