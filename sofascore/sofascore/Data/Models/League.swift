//
//  League.swift
//  sofascore
//
//  Created by akademija on 08.05.2026..
//

struct League: Codable {
    let id: Int
    let name: String
    let country: Country?
    let logoUrl: String
    let seasonId: Int?
}
