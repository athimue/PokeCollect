//
//  PokemonRepository.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Combine
import Foundation
import Resolver

protocol PokemonRepository {
    func fetchPokemons(query: String) -> AnyPublisher<[Pokemon], Error>
    func fetchPokemonGeneration(generation: Int) -> AnyPublisher<[Pokemon], Error>
    func fetchSuggestion(team: [Pokemon]) -> AnyPublisher<[Pokemon], Error>
}
