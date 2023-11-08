//
//  GetSearchUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 06/11/2023.
//

import Combine
import Foundation
import Resolver

protocol GetSearchUseCaseProtocol {
    func invoke(query: String) -> AnyPublisher<[Pokemon], Error>
}

class GetSearchUseCase: GetSearchUseCaseProtocol {
    @Injected private var pokemonRepository: PokemonRepository

    func invoke(query: String) -> AnyPublisher<[Pokemon], Error> {
        return pokemonRepository.fetchPokemons(query: query)
    }
}
