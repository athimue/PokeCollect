//
//  DatabaseManager+Migrator.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 06/11/2023.
//

import Foundation
import GRDB

extension DatabaseManager {
    var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        
        //migrator.eraseDatabaseOnSchemaChange = true
        
        migrator.registerMigration("v1") { db in
            try createTeam(db)
            try createCollection(db)
        }
        
        return migrator
    }
    
    private func createTeam(_ db: GRDB.Database) throws {
        try db.create(table: "team") { t in
            t.column("pokemonId", .integer).primaryKey().notNull()
        }
    }
    
    private func createCollection(_ db: GRDB.Database) throws {
        try db.create(table: "collection") { t in
            t.column("pokemonId", .integer).primaryKey().notNull()
        }
    }
}
