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
            try TeamMember.fetchAll(db)
        }
        
        let publisher = observation.publisher(in: databaseManager.reader)
        return publisher.eraseToAnyPublisher()
    }
    
    func removePokemon(id: Int) throws {
        try databaseManager.writer.write { db in
            _ = try TeamMember.filter(Column("id") == id).deleteAll(db)
        }
    }
    
    func addPokemon(teamMember: TeamMember) throws {
        try databaseManager.writer.write { db in
            try teamMember.insert(db)
        }
    }
}
