//
//  Player.swift
//  sofascore
//
//  Created by akademija on 03.06.2026..
//

struct Player: Codable {
    let id: Int
    let name: String?
    let shortName: String?
    let position: String?
    let jerseyNumber: String?
    let country: Country?
    let imageUrl: String
    let isForeign: Bool?
}
