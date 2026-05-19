//
//  ErrorHandling.swift
//  sofascore
//
//  Created by akademija on 18.05.2026..
//

enum ErrorHandling { }

//API Errors
extension ErrorHandling {
    static func handleAPI(error: APIError) {
        switch error {
            
        case .invalidURL:
            print("Invalid URL")
            
        case .invalidResponse:
            print("Invalid server response")
            
        case .fetchingFailed:
            print("Unknown error while fetching")
        }
    }
}
