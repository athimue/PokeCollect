//
//  CollectionRepository.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Combine
import Foundation

protocol CollectionRepository {
    func getCollection() -> AnyPublisher<[Pokemon], Error>
    func addPokemon(pokemonId: Int) -> Bool
    func removePokemon(pokemonId: Int) -> Bool
}
