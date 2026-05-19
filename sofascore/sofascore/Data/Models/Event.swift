//
//  Event.swift
//  sofascore
//
//  Created by akademija on 08.05.2026..
//

struct Event: Codable {
    let id: Int
    let homeTeam: Team
    let awayTeam: Team
    let startTimestamp: Int
    let status: EventStatus
    let league: League?
    let homeScore: Int?
    let awayScore: Int?
    let round: Int
    let incidents: [Incident]?
}
