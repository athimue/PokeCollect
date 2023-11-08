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
    
    func fetchPokemons(query: String) -> AnyPublisher<[Pokemon], Error> {
        pokemonApi.fetchSearch(query: query).map { pokemonResult in [Pokemon(id: pokemonResult.id, name: pokemonResult.name, image: pokemonResult.image, types: pokemonResult.apiTypes.map { $0.toType })]
        }.eraseToAnyPublisher()
    }
    
    func fetchPokemonGeneration(generation: Int) -> AnyPublisher<[Pokemon], Error> {
        pokemonApi.fetchPokemonGeneration(generation: generation).map { pokemonDtoArray in pokemonDtoArray.map {
            pokemonDto in Pokemon(id: pokemonDto.id, name: pokemonDto.name, image: pokemonDto.image, types: pokemonDto.apiTypes.map { $0.toType })
        }}.eraseToAnyPublisher()
    }
    
    func fetchSuggestion(team: [Pokemon]) -> AnyPublisher<[Pokemon], Error> {
        pokemonApi.fetchSuggestion(team: team).map { pokemonDtoArray in pokemonDtoArray.map {
            pokemonDto in Pokemon(id: pokemonDto.id, name: pokemonDto.name, image: pokemonDto.image, types: pokemonDto.apiTypes.map { $0.toType })
        }}.eraseToAnyPublisher()
    }
    
}
