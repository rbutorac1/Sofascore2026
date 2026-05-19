//
//  Hw3Data.swift
//  sofascore
//
//  Created by akademija on 21.03.2026..
//

import UIKit

final class EventsData {
    
    var events: [Event] = []
    var eventsDict: [String: [Event]] = [:]
    var leagues: [String] = []
    
    func loadData(sport: String) async throws {
        let events: [Event]
        events = try await APIClient.shared.fetchEvent(sport: sport)
        
        self.events = events
        
        let dictionary = Dictionary(grouping: events) {
            $0.league?.name ?? "No league"
        }
        self.eventsDict = dictionary
        
        self.leagues = eventsDict.keys.sorted()
    }
}

