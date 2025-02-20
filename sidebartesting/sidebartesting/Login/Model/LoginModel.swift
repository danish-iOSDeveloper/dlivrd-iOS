//
//  LoginModel.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 20/02/2025.
//

import Foundation
struct LoginRequest: Codable {
    struct Meta: Codable {
        let device_info: String
        let version: String
    }
    
    struct Data: Codable {
        let identity: String
        let password: String
        let meta: Meta
    }
    
    let data: Data
    let api_key: String
}


// MARK: - LoginResponse
struct LoginResponse: Codable {
    struct UserData: Codable {
        let profile_image: String
        let identity: String
        let first_name: String
        let last_name: String
        let email: String
        let mobile_number: String
        let fleet_id: Int
        let duty_status: Bool
        let notification_always_on: Bool
        let vibration_length: Int
        let notification_sound: String
        let language: String
        let show_traffic: Bool
        let debug: Bool
        let passkey_allow: Bool
        let fcm_refresh_time: Int
        let olc: String
        let olt: String
        let ps_loc: Bool
        let allow_night_orders: Bool
        let maps_preference: String
        let dark_mode: Bool
        let session_id: String
    }
    
    let response_type: APIResponseStatus
    let message: String
    let data: [UserData]
    
}
enum APIResponseStatus: String, Codable {
    case success
    case failure
}
struct LogoutRequest: Codable {
    struct Data: Codable {
        let identity: String
    }
    
    let data: Data
    let api_key: String
}
// MARK: - LogoutResponse
struct LogoutResponse: Codable {
    let response_type: String
    let message: String
}
