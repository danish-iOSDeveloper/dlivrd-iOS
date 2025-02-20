//
//  LoginView.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 17/02/2025.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginVM: LoginViewModel = .init()
    @StateObject private var locationManager = LocationManager.shared
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
                    CustomTextField(label: "Username", placeholder: "Enter Your Username", text: $loginVM.username, isPassword: false, isShowingPassword: $loginVM.isShowingPassword)
                    
                    // Password TextField
                    CustomTextField(label: "Password", placeholder: "Enter Your Password", text: $loginVM.password, isPassword: true, isShowingPassword: $loginVM.isShowingPassword)
                    
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
                        loginVM.loginButtonTapped()
                    } label: {
                        Text("Log In")
                            .padding(10)
                            .textDecoration(family: "Arial", size: 15, fontWeight: .regular)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(loginButtonBgColor)
                            .cornerRadius(10)
                    }
                    .navigationDestination(isPresented: $loginVM.isLoggedIn) {
                        HomeView() // Navigate to HomeView
                    }
                    
                }
                .padding()
            }
            .ignoresSafeArea(.keyboard)
        }
        .navigationBarBackButtonHidden()
        .alert("Authenication Error", isPresented: $loginVM.isShowingAuthError) {
            //
        } message: {
            Text(loginVM.errorMessage)
        }

    }
}
