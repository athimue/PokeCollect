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
        teamDao.getTeam().map { teamMember in
            teamMember.map { pokemon in Pokemon(id: pokemon.pokemonId, name: pokemon.name, image: "", types: []) }}.eraseToAnyPublisher()
    }

    func addPokemon(pokemonId: Int) throws {
        var pokemon = TeamMember(pokemonId: pokemonId, name: "Random")
        try teamDao.addPokemon(pokemonEntity: &pokemon)
    }

    func removePokemon(pokemonId: Int) throws {
        try teamDao.removePokemon(id: pokemonId)
    }
}
