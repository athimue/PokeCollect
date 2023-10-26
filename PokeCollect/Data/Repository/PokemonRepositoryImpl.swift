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

    func fetchPokemons(completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        pokemonApi.fetchPokemons(limit: 100) {
            result in

            switch result {
                case .success(let pokemonDtos):
                    let pokemons = pokemonDtos.map { pokemonDto in Pokemon(id: pokemonDto.id, name: pokemonDto.name, image: pokemonDto.image, types: pokemonDto.apiTypes.map { $0.toType }) }
                    completion(.success(pokemons))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }

    func fetchPokemonGeneration(generation: Int) -> AnyPublisher<[Pokemon], Error> {
        pokemonApi.fetchPokemonGeneration(generation: generation).map { pokemonDtoArray in pokemonDtoArray.map {
            pokemonDto in Pokemon(id: pokemonDto.id, name: pokemonDto.name, image: pokemonDto.image, types: pokemonDto.apiTypes.map { $0.toType })
        }}.eraseToAnyPublisher()
    }
}
