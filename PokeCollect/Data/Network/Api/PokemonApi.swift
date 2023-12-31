//
//  PokemonApi.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import Combine
import Foundation

let baseURL = "https://pokebuildapi.fr/api/v1"
let errorDomain = "PokemonAPIErrorDomain"

protocol PokemonAPIProtocol {
    func fetchPokemons(limit: Int, completion: @escaping (Result<[PokemonDto], Error>) -> Void)
    func fetchPokemonGeneration(generation: Int) -> AnyPublisher<[PokemonDto], Error>
    func fetchPokemon(pokemonId: Int) -> AnyPublisher<PokemonDto, Error>
    func fetchTypes() -> AnyPublisher<[TypeDetailDto], Error>
    func fetchSearch(query: String) -> AnyPublisher<PokemonDto, Error>
    func fetchSuggestion(team: [Pokemon]) -> AnyPublisher<[PokemonDto], Error>
    func fetchDefensiveCoverage(team: [Pokemon]) -> AnyPublisher<[DefensiveCoverageDto], Error>
}

class PokemonAPI: PokemonAPIProtocol {
    func fetchPokemon(pokemonId: Int) -> AnyPublisher<PokemonDto, Error> {
        guard let url = URL(string: "\(baseURL)/pokemon/\(pokemonId)") else {
            let error = NSError(domain: errorDomain, code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            return Result<PokemonDto, Error>.Publisher(error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: PokemonDto.self, decoder: JSONDecoder())
            .mapError { error -> Error in
                error
            }
            .eraseToAnyPublisher()
    }
    
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
    
    func fetchSearch(query: String) -> AnyPublisher<PokemonDto, Error> {
        guard let url = URL(string: "\(baseURL)/pokemon/\(query)") else {
            let error = NSError(domain: errorDomain, code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            return Result<PokemonDto, Error>.Publisher(error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: PokemonDto.self, decoder: JSONDecoder())
            .mapError { error -> Error in
                error
            }
            .eraseToAnyPublisher()
    }
    
    func fetchSuggestion(team: [Pokemon]) -> AnyPublisher<[PokemonDto], Error> {
        guard let url = URL(string: "\(baseURL)/team/suggestion/v2") else {
            let error = NSError(domain: errorDomain, code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            return Result<[PokemonDto], Error>.Publisher(error).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let jsonBody: [[String: String]] = team.reduce(into: [[String: String]]()) { result, pokemon in
            result.append([String(pokemon.id): ""])
        }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonBody, options: [])
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: [PokemonDto].self, decoder: JSONDecoder())
            .mapError { error -> Error in
                error
            }
            .eraseToAnyPublisher()
    }
    
    func fetchDefensiveCoverage(team: [Pokemon]) -> AnyPublisher<[DefensiveCoverageDto], Error> {
        guard let url = URL(string: "\(baseURL)/team/defensive-coverage/v2") else {
            let error = NSError(domain: errorDomain, code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            return Result<[DefensiveCoverageDto], Error>.Publisher(error).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let jsonBody: [[String: String]] = team.reduce(into: [[String: String]]()) { result, pokemon in
            result.append([String(pokemon.id): ""])
        }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonBody, options: [])
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: [DefensiveCoverageDto].self, decoder: JSONDecoder())
            .mapError { error -> Error in
                error
            }
            .eraseToAnyPublisher()
    }
}
