//
//  NetworkManager.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 20/02/2025.
//

import Foundation
import CoreData
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()

    func login(identity: String, password: String) async throws -> LoginResponse {
        let parameters = APIRequest(
            data: LoginRequest.Data(
                identity: identity,
                password: password,
                meta: LoginRequest.Meta(
                    device_info: "",
                    version: ""
                )
            ),
            api_key: Apikey
        )

        return try await NetworkService.shared.request(
            endpoint: .driverLogin,
            method: .post,
            parameters: parameters
        )
    }

    func logout(identity: String) async throws -> LogoutResponse {
        let parameters = APIRequest(
            data: LogoutRequest.Data(identity: identity),
            api_key: Apikey
        )

        return try await NetworkService.shared.request(
            endpoint: .driverLogout,
            method: .post,
            parameters: parameters
        )
    }
}

class NetworkService {
    static let shared = NetworkService()
    
    func request<T: Decodable>(
        endpoint: Router,
        method: HTTPMethod,
        parameters: Encodable? = nil
    ) async throws -> T {
        
        let url = BaseStagingURL + endpoint.rawValue
        let encodedParams = parameters.map { AnyEncodable($0) }  // Wrap parameters
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                url,
                method: method,
                parameters: encodedParams,
                encoder: JSONParameterEncoder.default
            )
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let result):
                    continuation.resume(returning: result)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}


struct APIRequest<T: Encodable>: Encodable {
    let data: T
    let api_key: String
}
struct AnyEncodable: Encodable {
    private let _encode: (Encoder) throws -> Void

    init<T: Encodable>(_ wrapped: T) {
        _encode = wrapped.encode
    }

    func encode(to encoder: Encoder) throws {
        try _encode(encoder)
    }
}
