//
//  SearchRepositoryImpl.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 06/11/2023.
//

import Combine
import Resolver

struct SearchRepositoryImpl: SearchRepository {
    
    @Injected private var pokemonApi: PokemonAPIProtocol
    
    func fetchSearch(query: String) -> AnyPublisher<[Pokemon], Error> {
        pokemonApi.fetchSearch(query: query).map { pokemonResult in [Pokemon(id: pokemonResult.id, name: pokemonResult.name, image: pokemonResult.image, types: pokemonResult.apiTypes.map { $0.toType })]
        }.eraseToAnyPublisher()
    }
}

