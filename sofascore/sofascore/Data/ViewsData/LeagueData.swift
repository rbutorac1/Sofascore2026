//
//  LeagueData.swift
//  sofascore
//
//  Created by akademija on 02.06.2026..
//

final class LeagueData {
    
    var matches: [Event] = []
    var roundDict: [Int: [Event]] = [:]
    var rounds: [Int] = []
    var standings: [Standings] = []
    
    var flags: [String: String] = [:]
    
    func loadLeagueMatches(league: League) async throws {
        let matches: [Event]
        matches = try await APIClient.shared.fetchMatches(id: league.id)
        
        self.matches = matches
        
        let dictionary = Dictionary(grouping: matches) {
            $0.round
        }
        self.roundDict = dictionary
        self.rounds = roundDict.keys.sorted()
    }
    
    func loadLeagueStandings(league: League) async throws {
        let standings: [Standings]
        standings = try await APIClient.shared.fetchStandings(id: league.id)
        
        self.standings = standings
    }
}
