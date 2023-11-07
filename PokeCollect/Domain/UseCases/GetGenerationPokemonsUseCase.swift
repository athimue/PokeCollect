//
//  GetFirstGenerationPokemonsUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import Combine
import Foundation
import Resolver

protocol GetGenerationPokemonsUseCaseProtocol {
    func invoke(generation: Int) -> AnyPublisher<[Pokemon], Error>
}

class GetGenerationPokemonsUseCase: GetGenerationPokemonsUseCaseProtocol {
    @Injected private var pokemonRepository: PokemonRepository

    func invoke(generation: Int) -> AnyPublisher<[Pokemon], Error> {
        return pokemonRepository.fetchPokemonGeneration(generation: generation)
    }
}
