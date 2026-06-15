//
//  IncidentsData.swift
//  sofascore
//
//  Created by akademija on 01.06.2026..
//

final class IncidentsData {
    
    var incidents: [Incident] = []
    
    func loadData(event: Event) async throws {
        let incidents: [Incident]
        incidents = try await APIClient.shared.fetchIncidents(id: event.id)
        
        self.incidents = incidents
    }
}
