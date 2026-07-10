//
//  Incident.swift
//  sofascore
//
//  Created by akademija on 08.05.2026..
//

struct Incident: Codable {
    let type: IncidentType
    let minute: Int
    let isHomeTeam: Bool?
    let extraMinute: Int?
    let player: String?
    let scoreDiff: Int?
    let score: String?
    let description: String?
}
