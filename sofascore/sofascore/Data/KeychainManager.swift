//
//  KeychainManager.swift
//  sofascore
//
//  Created by akademija on 23.05.2026..
//

import Foundation
import KeychainAccess

final class KeychainManager {
    
    static let shared = KeychainManager()
    
    private let keychain = Keychain(service: "academy.sofascore")
    private let tokenKey = "token"
        
    func saveToken(_ token: String) throws {
        try keychain.set(token, key: tokenKey)
    }
    
    func getToken() throws -> String? {
        try keychain.get(tokenKey)
    }
    
    func deleteToken() throws {
        try keychain.remove(tokenKey)
    }
}
