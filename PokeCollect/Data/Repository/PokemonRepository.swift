//
//  PokemonRepository.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//
import Foundation
import Resolver

protocol PokemonRepositoryProtocol {
    func fetchPokemons(completion: @escaping (Result<[Pokemon], Error>) -> Void)
    func fetchPokemonGeneration(generation: Int, completion: @escaping (Result<[Pokemon], Error>) -> Void)
}

struct PokemonRepository: PokemonRepositoryProtocol {
    
    @Injected private var pokemonApi: PokemonAPIProtocol
    
    func fetchPokemons(completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        pokemonApi.fetchPokemons(limit: 100) {
            result in
            switch result {
                case .success(let pokemonDtos):
                    let pokemons = pokemonDtos.map { pokemonDto in Pokemon(id: pokemonDto.id, name: pokemonDto.name, image: pokemonDto.image, types: pokemonDto.apiTypes.map{$0.toType})}
                    completion(.success(pokemons))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
    
    func fetchPokemonGeneration(generation: Int, completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        pokemonApi.fetchPokemonGeneration(generation: generation) {
            result in
            switch result {
                case .success(let pokemonDtos):
                    let pokemons = pokemonDtos.map { pokemonDto in Pokemon(id: pokemonDto.id, name: pokemonDto.name, image: pokemonDto.image, types: pokemonDto.apiTypes.map{$0.toType})}
                    completion(.success(pokemons))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
