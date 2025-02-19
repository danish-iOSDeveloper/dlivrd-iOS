//
//  TwoButtonToggleView.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 18/02/2025.
//

import SwiftUI

struct TwoButtonToggleView: View {
    @Binding var selectedButton: Int

    var body: some View {
        HStack(spacing: 10) {
            // Left Button
            Button(action: {
                selectedButton = 0
            }) {
                Text("Offered")
                    .textDecoration(fontWeight: selectedButton == 0 ? .bold : .ultraLight)
                    .frame(maxWidth: .infinity)
                    .padding(5)
                    .background(selectedButton == 0 ? loginButtonBgColor : Color.clear)
                    .cornerRadius(5)
            }
            
            // Right Button
            Button(action: {
                selectedButton = 1
            }) {
                Text("Accepted")
                    .frame(maxWidth: .infinity)
                    .padding(5)
                    .background(selectedButton == 1 ? loginButtonBgColor : Color.clear)
                    .textDecoration(fontWeight: selectedButton == 1 ? .bold : .thin)
                    .cornerRadius(5)
            }
        }
        .padding(2)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(5)
        .padding([.horizontal,.top], 20)
    }
}
