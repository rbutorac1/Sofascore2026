//
//  IncidentType.swift
//  sofascore
//
//  Created by akademija on 01.06.2026..
//

enum IncidentType: String, Codable {
    
    case goal = "GOAL"
    case redCard = "RED_CARD"
    case yellowCard = "YELLOW_CARD"
    case periodEnd = "PERIOD_END"
    case foul = "FOUL"
}
