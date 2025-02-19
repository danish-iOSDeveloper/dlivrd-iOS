//
//  CustomTextField.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 18/02/2025.
//

import SwiftUI

struct CustomTextField: View {
    var label: String
    var placeholder: String
    @Binding var text: String
    var isPassword: Bool = false
    @Binding var isShowingPassword: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .textDecoration(size: 15, fontWeight: .bold)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.1))
                    .stroke(Color.gray, lineWidth: 0)
                    .frame(height: 50)
               
                HStack {
                    if isPassword {
                        if !isShowingPassword {
                            SecureField(placeholder, text: $text)
                        } else {
                            TextField(placeholder, text: $text)
                        }
                    } else {
                        TextField(placeholder, text: $text)
                    }
                    Spacer()
                    
                    // Password visibility toggle button inside CustomTextField
                    if isPassword {
                        Button(action: {
                            isShowingPassword.toggle()
                        }) {
                            Image(isShowingPassword ? "eye" : "eye-closed")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.gray)
                        }
                    } else {
                        Image("email")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
            }
        }
    }
}
