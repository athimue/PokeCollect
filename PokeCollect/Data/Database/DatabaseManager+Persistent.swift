//
//  DatabaseManager+Persistent.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 06/11/2023.
//

import Foundation
import GRDB

extension DatabaseManager {
    static let shared = makeShared()
    
    static func makeShared() -> DatabaseManager {
        do {
            let fileManager = FileManager()
            
            let folder = try fileManager.url(
                for: .applicationSupportDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true
            ).appendingPathComponent("database", isDirectory: true)
            
            try fileManager.createDirectory(at: folder, withIntermediateDirectories: true)
            
            let databaseUrl = folder.appendingPathComponent("db.sqlite")
            
            let writer = try DatabasePool(path: databaseUrl.path)
            
            let database = try DatabaseManager(writer)
            
            return database
            
        } catch {
            fatalError("ERROR: \(error)")
        }
    }
}
