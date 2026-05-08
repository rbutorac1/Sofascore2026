//
//  APIClient.swift
//  sofascore
//
//  Created by akademija on 08.05.2026..
//

import Foundation

final class APIClient{
    static let shared = APIClient()
    
    private init(){}
    
    private let server = "https://sofascore-ios-academy-be-c63faa1a2212.herokuapp.com"
    
    func fetchEvent(sport: String) async throws -> [Event] {
        let endpoint = "/events?sport=\(sport)"
        let requestUrl = server + endpoint
        
        guard let url = URL(string: requestUrl) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        print(httpResponse.statusCode)
        
        return try JSONDecoder().decode([Event].self, from: data)
    }
    
    func fetchEventOld(sport: String, completition: @escaping (Result<[Event], Error>) -> Void){
        let endpoint = "/events?sport=\(sport)"
        let requestUrl = server + endpoint
        
        guard let url = URL(string: requestUrl) else {
            return completition(.failure(URLError(.badURL)))
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completition(.failure(URLError(.badServerResponse)))
                return
            }
            print(httpResponse.statusCode)
            
            guard let data = data else{
                completition(.failure(URLError(.badServerResponse)))
                return
            }
            
            do{
                let events = try JSONDecoder().decode([Event].self, from: data)
                completition(.success(events))
            } catch{
                completition(.failure(error))
            }
        }.resume()
    }
}
