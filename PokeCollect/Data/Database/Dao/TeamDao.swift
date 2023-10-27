//
//  TeamDao.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import GRDB
import Resolver
import Combine

struct TeamDao {
    
    @Injected var databaseManager: DatabaseManager
    
    func getTeam() -> AnyPublisher<[PokemonEntity], Error> {
        let observation = ValueObservation.tracking { db in
            try PokemonEntity.fetchAll(db)
        }
        return observation.publisher(in: databaseManager.dbQueue).eraseToAnyPublisher()
    }
    
    func removePokemon(id: Int) throws {
        try databaseManager.dbQueue.write { db in
            _ = try PokemonEntity.filter(Column("id") == id).deleteAll(db)
        }
    }
    
    func addPokemon(pokemonEntity: PokemonEntity) throws {
        try databaseManager.dbQueue.write { db in
            var mutableTeamEntity = pokemonEntity
            try mutableTeamEntity.insert(db)
        }
    }
}
