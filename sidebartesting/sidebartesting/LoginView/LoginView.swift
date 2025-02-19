//
//  LoginView.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 17/02/2025.
//

import SwiftUI

struct LoginView: View {
    // Properties
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false  // State to track login status
    @State private var isShowingPassword: Bool = false // State to show/hide password
    
    // View Body
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 10) {
                    Image("dilvrdICon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    
                    Text("Welcome Back!\n Enter your account information to log in")
                        .textDecoration(size: 15, fontWeight: .regular)
                        .multilineTextAlignment(.center)
                        .lineSpacing(3)
                    
                    Spacer(minLength: 30)
                    // Username TextField
                    CustomTextField(label: "Username", placeholder: "Enter Your Username", text: $username, isPassword: false, isShowingPassword: $isShowingPassword)
                    
                    // Password TextField
                    CustomTextField(label: "Password", placeholder: "Enter Your Password", text: $password, isPassword: true, isShowingPassword: $isShowingPassword)
                    
                    // Forgot Password
                    HStack {
                        Spacer()
                        Button {
                            print("Forgot Password Button tapped")
                        } label: {
                            Text("Forgot Password?")
                                .textDecoration(family: "Arial", size: 15, fontWeight: .regular, color: .green)
                        }
                    }
                    Spacer()
                    
                    // Log In Button
                    Button {
                        isLoggedIn = true  // Update state to trigger navigation
                    } label: {
                        Text("Log In")
                            .padding(10)
                            .textDecoration(family: "Arial", size: 15, fontWeight: .regular)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(loginButtonBgColor)
                            .cornerRadius(10)
                    }
                    .navigationDestination(isPresented: $isLoggedIn) {
                        HomeView() // Navigate to HomeView
                    }
                }
                .padding()
            }
            .ignoresSafeArea(.keyboard)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginView()
}
