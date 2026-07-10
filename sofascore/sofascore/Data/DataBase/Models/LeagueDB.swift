//
//  LeagueDB.swift
//  sofascore
//
//  Created by akademija on 24.05.2026..
//

import GRDB

struct LeagueDB: Codable, FetchableRecord, PersistableRecord {
    static let databaseTableName = "league"
    
    let id: Int
    let name: String
    let country: String?
    let logoUrl: String?
    let seasonId: Int?

    init(from league: League) {
        self.id = league.id
        self.name = league.name
        self.country = league.country?.name
        self.logoUrl = league.logoUrl
        self.seasonId = league.seasonId
    }
}
