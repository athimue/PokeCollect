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
                pokemonResult.toPokemon
            }.eraseToAnyPublisher()
    }

    func fetchPokemons(query: String) -> AnyPublisher<[Pokemon], Error> {
        pokemonApi
            .fetchSearch(query: query)
            .map { pokemonResult in
                [pokemonResult.toPokemon]
            }.eraseToAnyPublisher()
    }

    func fetchPokemonGeneration(generation: Int) -> AnyPublisher<[Pokemon], Error> {
        pokemonApi
            .fetchPokemonGeneration(generation: generation)
            .map { pokemonDtoArray in
                pokemonDtoArray.map { pokemonDto in
                    pokemonDto.toPokemon
                }
            }.eraseToAnyPublisher()
    }

    func fetchSuggestion(team: [Pokemon]) -> AnyPublisher<[Pokemon], Error> {
        pokemonApi.fetchSuggestion(team: team).map { pokemonDtoArray in
            pokemonDtoArray.map { pokemonDto in
                pokemonDto.toPokemon
            }
        }.eraseToAnyPublisher()
    }
}
