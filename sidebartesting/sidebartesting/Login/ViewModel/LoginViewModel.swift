//
//  LoginViewModel.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 20/02/2025.
//

import Foundation

class LoginViewModel: ObservableObject{
    // Properties
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false  // State to track login status
    @Published var isShowingAuthError = false
    @Published var isShowingPassword: Bool = false // State to show/hide password
    @Published var errorMessage: String = ""
    
    func loginButtonTapped() {
        if !username.isEmpty && !password.isEmpty {
            Task {
                do {
                    let response = try await NetworkManager.shared.login(identity: username, password: password)
                    DispatchQueue.main.async {[weak self] in
                        print("User Logged In: \(response.data.first?.first_name ?? "")")
                        print("User identity: \(response.data.first?.identity ?? "")")
                        if response.response_type == .success {
                            self?.isLoggedIn = true
                        }
                        if response.response_type == .failure {
                            self?.isLoggedIn = false
                            self?.errorMessage = "Username or password is incorrect."
                            self?.isShowingAuthError = true
                        }
                        print(response.message)
                        
                    }
                } catch {
                    DispatchQueue.main.async {[weak self] in
                        self?.errorMessage = error.localizedDescription
                        self?.isShowingAuthError = true
                    }
                }
            }
        } else {
            errorMessage = "Username and password are required."
            isShowingAuthError = true
        }

    }
}
