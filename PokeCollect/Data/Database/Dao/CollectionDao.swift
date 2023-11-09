//
//  CollectionDao.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Combine
import GRDB
import Resolver

struct CollectionDao {
    @Injected var databaseManager: DatabaseManager

    func getCollection() -> AnyPublisher<[CollectionMember], Error> {
        return ValueObservation.tracking {
            db in try CollectionMember.fetchAll(db)
        }.publisher(in: databaseManager.reader).eraseToAnyPublisher()
    }

    func removePokemon(pokemonId: Int) -> Bool {
        do {
            try databaseManager.writer.write { db in
                _ = try CollectionMember.filter(Column("pokemonId") == pokemonId).deleteAll(db)
            }
            return true
        } catch {
            return false
        }
    }

    func addPokemon(pokemonEntity: CollectionMember) -> Bool {
        do {
            try databaseManager.writer.write { db in
                try pokemonEntity.save(db)
            }
            return true
        } catch {
            return false
        }
    }
}
