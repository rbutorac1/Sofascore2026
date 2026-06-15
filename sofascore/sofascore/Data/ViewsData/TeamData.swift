//
//  TeamData.swift
//  sofascore
//
//  Created by akademija on 04.06.2026..
//

final class TeamData {
    
    var team: TeamInfo?
    var tournaments: [League] = []
    var players: [Player] = []
    
    var flags: [String: String] = [:]
    
    func loadTeam(team: Team) async throws {
        let teamDetails = try await APIClient.shared.fetchTeam(id: team.id)
        let tournaments = try await APIClient.shared.fetchTournaments(id: team.id)
        let players = try await APIClient.shared.fetchPlayers(id: team.id)
        
        self.team = teamDetails
        self.tournaments = tournaments
        self.players = players
    }

    func getNumberTotal() -> Int {
        return players.count
    }
    
    func getNumberForeign() -> Int {
        var count: Int = 0
        for player in players {
            if let isForeign = player.isForeign {
                if(isForeign){
                    count += 1
                }
            }
        }
        return count
    }
}
