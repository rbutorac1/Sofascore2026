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
    
    private func getData(endpoint: String, details: String) async throws -> Data {
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
            print("Fetching \(details)... Status code: \(httpResponse.statusCode)")
                        
            return data
        } catch {
            throw APIError.fetchingFailed
        }
    }
        
    func fetchEvent(sport: String) async throws -> [Event] {
        let endpoint = "/events?sport=\(sport)"
        
        do {
            let data = try await getData(endpoint: endpoint, details: "events")
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
        
    func fetchIncidents(id: Int) async throws -> [Incident] {
        let endpoint = "/events/\(id)/incidents"
        
        do {
            let data = try await getData(endpoint: endpoint, details: "incidents")
            let incidents = try JSONDecoder().decode([Incident].self, from: data)
            
            return incidents
        } catch {
            throw APIError.fetchingFailed
        }
    }
    
    func fetchMatches(id: Int) async throws -> [Event] {
        let endpoint = "/leagues/\(id)/matches"
        
        do {
            let data = try await getData(endpoint: endpoint, details: "matches")
            let matches = try JSONDecoder().decode([Event].self, from: data)
            
            return matches
        } catch {
            throw APIError.fetchingFailed
        }
    }
    
    func fetchStandings(id: Int) async throws -> [Standings] {
        let endpoint = "/leagues/\(id)/standings"
        
        do {
            let data = try await getData(endpoint: endpoint, details: "standings")
            let standings = try JSONDecoder().decode([Standings].self, from: data)
            
            return standings
        } catch {
            throw APIError.fetchingFailed
        }
    }
    
    func fetchTeam(id: Int) async throws -> TeamInfo {
        let endpoint = "/teams/\(id)"
        
        do {
            let data = try await getData(endpoint: endpoint, details: "team")
            let team = try JSONDecoder().decode(TeamInfo.self, from: data)
            
            return team
        } catch {
            throw APIError.fetchingFailed
        }
    }
    
    func fetchTournaments(id: Int) async throws -> [League] {
        let endpoint = "/teams/\(id)/tournaments"
        
        do {
            let data = try await getData(endpoint: endpoint, details: "tournaments")
            let tournaments = try JSONDecoder().decode([League].self, from: data)
            
            return tournaments
        } catch {
            throw APIError.fetchingFailed
        }
    }
        
    func fetchPlayers(id: Int) async throws -> [Player] {
        let endpoint = "/teams/\(id)/players"
        
        do {
            let data = try await getData(endpoint: endpoint, details: "players")
            let players = try JSONDecoder().decode([Player].self, from: data)
            
            return players
        } catch {
            throw APIError.fetchingFailed
        }
    }
}
