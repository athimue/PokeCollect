//
//  CollectionRepository.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Foundation
import Combine

protocol CollectionRepository {
    func getCollection() -> AnyPublisher<[Pokemon], Error>
    func addPokemon(pokemonId: Int) throws -> Void
    func removePokemon(pokemonId: Int) throws -> Void
}
