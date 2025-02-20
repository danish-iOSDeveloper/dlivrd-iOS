//
//  sidebartestingApp.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 17/02/2025.
//

import SwiftUI

@main
struct sidebartestingApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
