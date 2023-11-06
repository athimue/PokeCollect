//
//  CollectionDao.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Resolver
import GRDB
import Combine

struct CollectionDao {
    
    @Injected var databaseManager: DatabaseManager
    
    func getCollection() -> AnyPublisher<[CollectionMember], Error> {
        return ValueObservation.tracking {
            db in try CollectionMember.fetchAll(db)
        }.publisher(in: databaseManager.reader).eraseToAnyPublisher()
    }
    
    func removeItemCollection(id: Int) throws {
        try databaseManager.writer.write { db in
            _ = try CollectionMember.filter(Column("id") == id).deleteAll(db)
        }
    }
    
    func addCollectionMember(collectionMember: CollectionMember) throws {
        try databaseManager.writer.write { db in
            var mutableCollectionMember = collectionMember
            try mutableCollectionMember.insert(db)
        }
    }
}

