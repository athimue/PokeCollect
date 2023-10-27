//
//  TeamRepositoryImpl.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Combine
import Foundation
import Resolver

struct TeamRepositoryImpl: TeamRepository {
    @Injected private var teamDao: TeamDao

    func getTeam() -> AnyPublisher<[Pokemon], Error> {
        teamDao.getTeam().print("ici").map { teamEntityArray in 
            teamEntityArray.map { pokemon in Pokemon(id: pokemon.id, name: "coucou", image: "", types: []) }}.eraseToAnyPublisher()
    }

    func addPokemon(pokemonId: Int) throws {
        try teamDao.addPokemon(teamEntity: TeamEntity(id: pokemonId))
    }

    func removePokemon(pokemonId: Int) throws {
        try teamDao.removePokemon(id: pokemonId)
    }
}
