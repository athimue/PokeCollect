//
//  PokemonApi.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//
import Foundation

// Define constants for the base URL and the error domain
let baseURL = "https://pokebuildapi.fr/api/v1/pokemon"
let errorDomain = "PokemonAPIErrorDomain"

// Rename the protocol and the function to be more descriptive and follow Swift conventions
protocol PokemonAPIProtocol {
    func fetchPokemons(limit: Int, completion: @escaping (Result<[PokemonDto], Error>) -> Void)
}

class PokemonAPI: PokemonAPIProtocol {
    
    func fetchPokemons(limit: Int,completion: @escaping(Result<[PokemonDto], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/limit/\(limit)") else {
            let error = NSError(domain: errorDomain, code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
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
}
