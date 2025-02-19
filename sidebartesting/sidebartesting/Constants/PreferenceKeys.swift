//
//  PreferenceKeys.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 19/02/2025.
//

import Foundation
import SwiftUI

struct InnerHeightPreferenceKey: PreferenceKey {
    static let defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
