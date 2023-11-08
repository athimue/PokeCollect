//
//  TeamDao.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Combine
import GRDB
import Resolver
import SwiftUI

struct TeamDao {
    @Injected var databaseManager: DatabaseManager
    
    func getTeam() -> AnyPublisher<[TeamMember], Error> {
        let observation = ValueObservation.tracking { db in
            try TeamMember.limit(6).fetchAll(db)
        }
        
        let publisher = observation.publisher(in: databaseManager.reader)
        return publisher.eraseToAnyPublisher()
    }
    
    func removePokemon(pokemonId: Int) throws {
        try databaseManager.writer.write { db in
            _ = try TeamMember.filter(Column("pokemonId") == pokemonId).deleteAll(db)
        }
    }
    
    func addPokemon(teamMember: TeamMember) -> Bool {
        do  {
            let team: [TeamMember] = try databaseManager.reader.read { db in
                try TeamMember.fetchAll(db)
            }
            if team.count < 6 {
                try databaseManager.writer.write { db in
                    try teamMember.save(db)
                }
                return true
            }
            return false
        }
        catch {
            print("error")
            return false
        }
    }
}
