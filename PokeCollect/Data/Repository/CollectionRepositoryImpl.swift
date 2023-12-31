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
    @Injected private var pokemonAPI: PokemonAPIProtocol

    func addPokemon(pokemonId: Int) -> Bool {
        collectionDao.addPokemon(pokemonEntity: CollectionMember(pokemonId: pokemonId))
    }

    func removePokemon(pokemonId: Int) -> Bool {
        collectionDao.removePokemon(pokemonId: pokemonId)
    }

    func getCollection() -> AnyPublisher<[Pokemon], Error> {
        return collectionDao.getCollection()
            .flatMap { collectionEntities -> AnyPublisher<[PokemonDto], Error> in
                let pokemonPublishers = collectionEntities.map { entity in
                    pokemonAPI.fetchPokemon(pokemonId: entity.pokemonId)
                }
                return Publishers.MergeMany(pokemonPublishers).collect().eraseToAnyPublisher()
            }
            .map { pokemonDtos in
                pokemonDtos.map { pokemonDto in
                    pokemonDto.toPokemon
                }
            }
            .eraseToAnyPublisher()
    }
}
