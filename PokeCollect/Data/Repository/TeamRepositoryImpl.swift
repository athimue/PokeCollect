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
            .flatMap { collectionEntities -> AnyPublisher<[PokemonDto], Error> in
                let pokemonPublishers = collectionEntities.map { entity in
                    return pokemonAPI.fetchPokemon(pokemonId: entity.pokemonId)
                }
                return Publishers.MergeMany(pokemonPublishers).collect().eraseToAnyPublisher()
            }
            .map { pokemonDtos in
                return pokemonDtos.map { pokemonDto in
                    Pokemon(id: pokemonDto.id, name: pokemonDto.name, image: pokemonDto.image, types: pokemonDto.apiTypes.map { $0.toType })
                }
            }
            .eraseToAnyPublisher()
    }

    func addPokemon(pokemonId: Int) -> Bool{
        return teamDao.addPokemon(teamMember: TeamMember(pokemonId: pokemonId))
    }

    func removePokemon(pokemonId: Int) throws {
        try teamDao.removePokemon(id: pokemonId)
    }
}
