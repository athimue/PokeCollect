//
//  PokemonApi.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//
import Combine
import Foundation

// Define constants for the base URL and the error domain
let baseURL = "https://pokebuildapi.fr/api/v1"
let errorDomain = "PokemonAPIErrorDomain"

// Rename the protocol and the function to be more descriptive and follow Swift conventions
protocol PokemonAPIProtocol {
    func fetchPokemons(limit: Int, completion: @escaping (Result<[PokemonDto], Error>) -> Void)
    func fetchPokemonGeneration(generation: Int) -> AnyPublisher<[PokemonDto], Error>
    func fetchTypes() -> AnyPublisher<[TypeDetailDto], Error>
}

class PokemonAPI: PokemonAPIProtocol {
    func fetchPokemons(limit: Int, completion: @escaping (Result<[PokemonDto], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/pokemon/limit/\(limit)") else {
            let error = NSError(domain: errorDomain, code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NSError(domain: errorDomain, code: 2, userInfo: [NSLocalizedDescriptionKey: "Network error"])))
                return
            }
            
            do {
                let pokemonList = try JSONDecoder().decode([PokemonDto].self, from: data)
                completion(.success(pokemonList))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchPokemonGeneration(generation: Int) -> AnyPublisher<[PokemonDto], Error> {
        guard let url = URL(string: "\(baseURL)/pokemon/generation/\(generation)") else {
            let error = NSError(domain: errorDomain, code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            return Result<[PokemonDto], Error>.Publisher(error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [PokemonDto].self, decoder: JSONDecoder())
            .mapError { error -> Error in
                error
            }
            .eraseToAnyPublisher()
    }
    
    func fetchTypes() -> AnyPublisher<[TypeDetailDto], Error> {
        guard let url = URL(string: "\(baseURL)/types") else {
            let error = NSError(domain: errorDomain, code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            return Result<[TypeDetailDto], Error>.Publisher(error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [TypeDetailDto].self, decoder: JSONDecoder())
            .mapError { error -> Error in
                error
            }
            .eraseToAnyPublisher()
    }
}
