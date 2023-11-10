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
    @Injected private var pokemonAPI: PokemonAPIProtocol

    func getTeam() -> AnyPublisher<[Pokemon], Error> {
        return teamDao.getTeam()
            .flatMap { teamEntities -> AnyPublisher<[PokemonDto], Error> in
                let pokemonPublishers = teamEntities.map { entity in
                    pokemonAPI.fetchPokemon(pokemonId: entity.pokemonId)
                }
                return Publishers.MergeMany(pokemonPublishers).collect().eraseToAnyPublisher()
            }
            .map { pokemonDtos in
                pokemonDtos.map { pokemonDto in
                    pokemonDto.toPokemon
                }
            }
            .eraseToAnyPublisher()
    }

    func addPokemon(pokemonId: Int) -> Bool {
        return teamDao.addPokemon(teamMember: TeamMember(pokemonId: pokemonId))
    }

    func removePokemon(pokemonId: Int) -> Bool {
        teamDao.removePokemon(pokemonId: pokemonId)
    }
}
