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
                    Pokemon(
                        id: pokemonDto.id,
                        name: pokemonDto.name,
                        generation: pokemonDto.apiGeneration,
                        image: pokemonDto.image,
                        types: pokemonDto.apiTypes.map { $0.toType },
                        stats: pokemonDto.stats.toStats,
                        resistances: pokemonDto
                            .apiResistances
                            .map { resistanceDto in Resistance(
                                name: "https://static.wikia.nocookie.net/pokemongo/images/\(PokemonTranslator.translateType(resistanceDto.name ?? "f/fb/Normal")).png",
                                damageMultiplier: resistanceDto.damage_multiplier,
                                damageRelation: resistanceDto.damage_relation)
                            },
                        evolutions: pokemonDto
                            .apiEvolutions
                            .map {
                                evolutionDto in Evolution(name: evolutionDto.name, pokedexId: evolutionDto.pokedexId)
                            },
                        preEvolutions: Evolution(name: "", pokedexId: 1)
                    )
                }
            }
            .eraseToAnyPublisher()
    }

    func addPokemon(pokemonId: Int) -> Bool {
        return teamDao.addPokemon(teamMember: TeamMember(pokemonId: pokemonId))
    }

    func removePokemon(pokemonId: Int) throws {
        try teamDao.removePokemon(pokemonId: pokemonId)
    }
}
