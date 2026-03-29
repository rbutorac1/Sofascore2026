//
//  Hw3Data.swift
//  sofascore
//
//  Created by akademija on 21.03.2026..
//

import UIKit
import SofaAcademic

public class Hw3Data {
    
    var events: [Event] {
        let data = Homework3DataSource()
        return data.events()
    }
        
    var eventsDict: [String: [Event]] {
        Dictionary(grouping: events) { $0.league?.name ?? "No league"}
    }
    
    var leagues: [String] {
        eventsDict.keys.sorted()
    }
}

