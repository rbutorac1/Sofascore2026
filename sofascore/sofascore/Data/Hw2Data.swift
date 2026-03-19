//
//  Hw2Data.swift
//  sofascore
//
//  Created by akademija on 19.03.2026..
//

import UIKit
import SofaAcademic

public class Hw2Data {

    var laLiga: League {
        let data = Homework2DataSource()
        return data.laLigaLeague()
    }
    
    var events: [Event] {
        let data = Homework2DataSource()
        return data.laLigaEvents()
    }

    var matches: [Match] {
        events.map { Match(event: $0) }
    }
}
