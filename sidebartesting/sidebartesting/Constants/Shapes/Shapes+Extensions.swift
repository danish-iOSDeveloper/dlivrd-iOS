//
//  Shapes+Extensions.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 19/02/2025.
//

import Foundation
import SwiftUI

//MARK: Drawing line for Markers of Various Locations
struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: (rect.height + rect.height*0.2)))
        return path
    }
}
