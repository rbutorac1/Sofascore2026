//
//  Hw3Data.swift
//  sofascore
//
//  Created by akademija on 21.03.2026..
//

import UIKit
import SofaAcademic

public class Hw3Data {
    
    let premierLeague = League(
        id: 2,
        name: "Premier League",
        country: Country(id: 2, name: "England"),
        logoUrl: "https://img.sofascore.com/api/v1/unique-tournament/17/image"
    )
    
    var laLiga: League {
        let data = Homework2DataSource()
        return data.laLigaLeague()
    }
    
    var events: [Event] {
        let data = Homework3DataSource()
        return data.events()
    }
}
