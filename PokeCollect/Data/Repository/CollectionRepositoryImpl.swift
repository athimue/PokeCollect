//
//  CollectionRepository.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Combine
import Foundation
import Resolver

struct CollectionRepositoryImpl: CollectionRepository {
    @Injected private var collectionDao: CollectionDao

    func getCollection() -> AnyPublisher<[Pokemon], Error> {
        collectionDao.getCollection().map { collectionMember in collectionMember.map { pokemon in Pokemon(id: pokemon.pokemonId, name: "", image: "", types: []) }}.eraseToAnyPublisher()
    }
    
    
    func addPokemon(pokemonId: Int) throws {
        var pokemon = CollectionMember(pokemonId: pokemonId)
        try collectionDao.addPokemon(pokemonEntity: &pokemon)
    }
    
    func removePokemon(pokemonId: Int) throws {
        try collectionDao.removePokemon(id: pokemonId)
    }
}
