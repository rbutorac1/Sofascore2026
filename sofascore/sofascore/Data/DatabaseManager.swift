//
//  DatabaseManager.swift
//  sofascore
//
//  Created by akademija on 24.05.2026..
//

import Foundation
import GRDB

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let dbQueue: DatabaseQueue
    
    private init(){
        do {
            let folderURL = try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            
            let dbURL = folderURL.appendingPathComponent("database.sqlite")
            dbQueue = try DatabaseQueue(path: dbURL.path)
            
            try migrator.migrate(dbQueue)
        } catch {
            fatalError("DB error \(error)")
        }
    }
    
    private var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        
        migrator.registerMigration("createTables") { db in
            try db.create(table: "league", ifNotExists: true) { table in
                table.column("id", .integer).primaryKey()
                table.column("name", .text).notNull()
                table.column("country", .text)
                table.column("logoUrl", .text)
                table.column("seasonId", .integer).notNull()
            }
            
            try db.create(table: "event", ifNotExists: true) { table in
                table.column("id", .integer).primaryKey()
                table.column("homeTeamName", .text).notNull()
                table.column("awayTeamName", .text).notNull()
                table.column("startTimestamp", .integer).notNull()
                table.column("status", .text).notNull()
                table.column("leagueId", .integer)
                table.column("homeScore", .integer)
                table.column("awayScore", .integer)
                table.column("round", .integer).notNull()
            }
        }
        
        return migrator
    }
    
    func saveEvents(_ events: [EventDB]) throws {
        try dbQueue.write { db in
            for event in events {
                try event.save(db, onConflict: .replace)
            }
        }
    }
    
    func saveLeagues(_ leagues: [LeagueDB]) throws {
        try dbQueue.write { db in
            for league in leagues {
                try league.save(db, onConflict: .replace)
            }
        }
    }
    
    func getEventCount() throws -> Int {
        try dbQueue.read { db in
            try EventDB.fetchCount(db)
        }
    }
    
    func getLeagueCount() throws -> Int {
        try dbQueue.read { db in
            try LeagueDB.fetchCount(db)
        }
    }
    
    func deleteAllTables() throws {
        try dbQueue.write { db in
            try EventDB.deleteAll(db)
            try LeagueDB.deleteAll(db)
        }
    }
}
