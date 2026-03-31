//
//  Hw3Data.swift
//  sofascore
//
//  Created by akademija on 21.03.2026..
//

import UIKit
import SofaAcademic

public class Hw3Data {
    
    let events: [Event]
    let eventsDict: [String: [Event]]
    let leagues: [String]
    
    init(){
        let dataSource = Homework3DataSource()
        let events = dataSource.events()
        
        self.events = events
        
        let dictionary = Dictionary(grouping: events) {
            $0.league?.name ?? "No league"
        }
        self.eventsDict = dictionary
        
        self.leagues = eventsDict.keys.sorted()
    }
}

