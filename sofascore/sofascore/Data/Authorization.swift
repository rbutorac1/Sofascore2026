//
//  Authorization.swift
//  sofascore
//
//  Created by akademija on 22.05.2026..
//

import Foundation

final class Authorization {
    static func login(username: String, password: String) async throws -> LoginResponse {
        let requestURL = "https://sofascore-ios-academy-be-c63faa1a2212.herokuapp.com/login"
        
        guard let url = URL(string: requestURL) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = [
            "username": username,
            "password": password
        ]
        
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        return try JSONDecoder().decode(LoginResponse.self, from: data)
    }
}
