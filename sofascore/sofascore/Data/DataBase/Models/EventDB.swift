//
//  EventDB.swift
//  sofascore
//
//  Created by akademija on 24.05.2026..
//

import GRDB

struct EventDB: Codable, FetchableRecord, PersistableRecord {
    static let databaseTableName = "event"
    
    let id: Int
    let homeTeamName: String
    let awayTeamName: String
    let startTimestamp: Int
    let status: String
    let leagueId: Int?
    let homeScore: Int?
    let awayScore: Int?
    let round: Int
    
    init(from event: Event) {
        self.id = event.id
        self.homeTeamName = event.homeTeam.name
        self.awayTeamName = event.awayTeam.name
        self.startTimestamp = event.startTimestamp
        self.status = event.status.rawValue
        self.leagueId = event.league?.id
        self.homeScore = event.homeScore
        self.awayScore = event.awayScore
        self.round = event.round
    }
}
