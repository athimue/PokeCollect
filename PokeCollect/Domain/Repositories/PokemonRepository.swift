//
//  PokemonRepository.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Foundation
import Combine
import Resolver

protocol PokemonRepository {
    func fetchPokemons(completion: @escaping (Result<[Pokemon], Error>) -> Void)
    func fetchPokemonGeneration(generation: Int) -> AnyPublisher<[Pokemon], Error>
}
