//
//  APIClient.swift
//  sofascore
//
//  Created by akademija on 08.05.2026..
//

import Foundation

final class APIClient {
    static let shared = APIClient()
        
    private let server = "https://sofascore-ios-academy-be-c63faa1a2212.herokuapp.com"
    
    func fetchEvent(sport: String) async throws -> [Event] {
        let endpoint = "/events?sport=\(sport)"
        let requestUrl = server + endpoint
        
        guard let url = URL(string: requestUrl) else {
            throw APIError.invalidURL
        }
        
        guard let token = try KeychainManager.shared.getToken() else {
            throw APIError.invalidResponse
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }
            print(httpResponse.statusCode)
            
            let events = try JSONDecoder().decode([Event].self, from: data)
            
            let eventsDB = events.map { EventDB(from: $0) }
            let leagueDB = events.compactMap { $0.league }.map { LeagueDB(from: $0) }
            
            try DatabaseManager.shared.saveEvents(eventsDB)
            try DatabaseManager.shared.saveLeagues(leagueDB)
            
            return events
        } catch {
            throw APIError.fetchingFailed
        }
    }
    
    func fetchEventOld(sport: String, completition: @escaping (Result<[Event], Error>) -> Void) {
        let endpoint = "/events?sport=\(sport)"
        let requestUrl = server + endpoint
        
        guard let url = URL(string: requestUrl) else {
            return completition(.failure(APIError.invalidURL))
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completition(.failure(APIError.invalidResponse))
                return
            }
            print(httpResponse.statusCode)
            
            guard let data = data else{
                completition(.failure(APIError.invalidResponse))
                return
            }
            
            do {
                let events = try JSONDecoder().decode([Event].self, from: data)
                completition(.success(events))
            } catch{
                completition(.failure(APIError.fetchingFailed))
            }
        }.resume()
    }
}
