//
//  CollectionDao.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Resolver
import GRDB
import UIKit

struct CollectionDao {
    
    @Injected var databaseManager: DatabaseManager
    
    func getCollection() throws -> [CollectionEntity] {
        return try databaseManager.dbQueue.read { db in
            try CollectionEntity.fetchAll(db)
        }
    }
    
    func removePokemon(id: Int) throws {
        try databaseManager.dbQueue.write { db in
            _ = try CollectionEntity.filter(Column("id") == id).deleteAll(db)
        }
    }
    
    func addPokemon(collection: CollectionEntity) throws {
        try databaseManager.dbQueue.write { db in
            var mutableCollection = collection
            try mutableCollection.insert(db)
        }
    }
}

