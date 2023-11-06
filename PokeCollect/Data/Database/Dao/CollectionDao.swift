//
//  CollectionDao.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Resolver
import GRDB
import UIKit
import Combine

struct CollectionDao {
    
    @Injected var databaseManager: DatabaseManager
    
    func getCollection() -> AnyPublisher<[CollectionEntity], Error> {
        return ValueObservation.tracking {
            db in try CollectionEntity.fetchAll(db)
        }.publisher(in: databaseManager.reader).eraseToAnyPublisher()
    }
    
    func removeItemCollection(id: Int) throws {
        try databaseManager.writer.write { db in
            _ = try CollectionEntity.filter(Column("id") == id).deleteAll(db)
        }
    }
    
    func addItemCollection(collection: CollectionEntity) throws {
        try databaseManager.writer.write { db in
            var mutableCollection = collection
            try mutableCollection.insert(db)
        }
    }
}

