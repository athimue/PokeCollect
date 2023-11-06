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
        
        #if DEBUG
        migrator.eraseDatabaseOnSchemaChange = true
        #endif
        
        migrator.registerMigration("v1") { db in
            try createTeam(db)
        }
        
        return migrator
    }
    
    private func createTeam(_ db: GRDB.Database) throws {
        try db.create(table: "team") { t in
            t.autoIncrementedPrimaryKey("id")
            t.column("pokemonId", .integer).notNull()
            t.column("name", .text).notNull()
        }
    }
}
