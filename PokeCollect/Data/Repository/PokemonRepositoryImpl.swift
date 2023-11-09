//
//  PokemonRepository.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//
import Combine
import Foundation
import Resolver

struct PokemonRepositoryImpl: PokemonRepository {
    @Injected private var pokemonApi: PokemonAPIProtocol
    
    func fetchPokemon(pokemonId: Int) -> AnyPublisher<Pokemon, Error> {
        pokemonApi.fetchPokemon(pokemonId: pokemonId)
            .map { pokemonResult in
                Pokemon(
                    id: pokemonResult.id,
                    name: pokemonResult.name,
                    generation: pokemonResult.apiGeneration,
                    image: pokemonResult.image,
                    types: pokemonResult.apiTypes.map { $0.toType },
                    stats: pokemonResult.stats.toStats,
                    resistances: pokemonResult
                        .apiResistances
                        .map {
                            resistanceDto in
                                Resistance(
                                    name: "https://static.wikia.nocookie.net/pokemongo/images/\(PokemonTranslator.translateType(resistanceDto.name ?? "f/fb/Normal")).png",
                                    damageMultiplier: resistanceDto.damage_multiplier,
                                    damageRelation: resistanceDto.damage_relation)
                        },
                    evolutions: pokemonResult
                        .apiEvolutions
                        .map {
                            evolutionDto in Evolution(name: evolutionDto.name, pokedexId: evolutionDto.pokedexId)
                        },
                    preEvolutions: getPreEvolution(pokemonResult: pokemonResult.apiPreEvolution)
                )
            }.eraseToAnyPublisher()
    }
    
    private func getPreEvolution(pokemonResult: APIPreEvolutionUnion) -> Evolution? {
        switch pokemonResult {
            case .apiPreEvolutionClass(let dto):
                return Evolution(name: dto.name, pokedexId: dto.pokedexIdd)
            case .enumeration(_):
                return nil
        }
    }
    
    func fetchPokemons(query: String) -> AnyPublisher<[Pokemon], Error> {
        pokemonApi
            .fetchSearch(query: query)
            .map { pokemonResult in
                [
                    Pokemon(
                        id: pokemonResult.id,
                        name: pokemonResult.name,
                        generation: pokemonResult.apiGeneration,
                        image: pokemonResult.image,
                        types: pokemonResult.apiTypes.map { $0.toType },
                        stats: pokemonResult.stats.toStats,
                        resistances: pokemonResult
                            .apiResistances
                            .map { resistanceDto in Resistance(
                                name: "https://static.wikia.nocookie.net/pokemongo/images/\(PokemonTranslator.translateType(resistanceDto.name ?? "f/fb/Normal")).png",
                                damageMultiplier: resistanceDto.damage_multiplier,
                                damageRelation: resistanceDto.damage_relation
                            )
                            },
                        evolutions: pokemonResult
                            .apiEvolutions
                            .map {
                                evolutionDto in Evolution(name: evolutionDto.name, pokedexId: evolutionDto.pokedexId)
                            },
                        preEvolutions: Evolution(name: "", pokedexId: 1)
                    )
                ]
            }.eraseToAnyPublisher()
    }
    
    func fetchPokemonGeneration(generation: Int) -> AnyPublisher<[Pokemon], Error> {
        pokemonApi
            .fetchPokemonGeneration(generation: generation)
            .map { pokemonDtoArray in pokemonDtoArray.map { pokemonDto in
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
                                    damageRelation: resistanceDto.damage_relation
                                )
                                },
                            evolutions: pokemonDto
                                .apiEvolutions
                                .map {
                                    evolutionDto in Evolution(name: evolutionDto.name, pokedexId: evolutionDto.pokedexId)
                                },
                            preEvolutions: Evolution(name: "", pokedexId: 1)
                        )
                }
            }.eraseToAnyPublisher()
    }

    
    func fetchSuggestion(team: [Pokemon]) -> AnyPublisher<[Pokemon], Error> {
        pokemonApi.fetchSuggestion(team: team).map { pokemonDtoArray in pokemonDtoArray.map {
            pokemonDto in
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
                        damageRelation: resistanceDto.damage_relation
                    )
                    },
                evolutions: pokemonDto
                    .apiEvolutions
                    .map {
                        evolutionDto in Evolution(name: evolutionDto.name, pokedexId: evolutionDto.pokedexId)
                    },
                preEvolutions: Evolution(name: "", pokedexId: 1)
            )
        }}.eraseToAnyPublisher()
    }
}
