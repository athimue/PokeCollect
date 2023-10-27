//
//  DatabaseManager.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Foundation
import GRDB

class DatabaseManager {
    var dbQueue: DatabaseQueue!

    init() {
        do {
            try setupDatabase()
        } catch {
            print(error)
        }
    }

    func setupDatabase() throws {
        let fileURL = try FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("db.sqlite")
        dbQueue = try DatabaseQueue(path: fileURL.path)
        
        try dbQueue.write { db in
            try db.create(table: "Team") { t in
                t.column("id", .integer).primaryKey()
            }
            
            try db.create(table: "Collection") { t in
                t.column("id", .integer).primaryKey()
            }
        }
    }
}
