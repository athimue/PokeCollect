//
//  DeletePokemonFromCollectionUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 07/11/2023.
//

import Foundation
import Resolver

protocol DeletePokemonFromCollectionUseCaseProtocol {
    func invoke(pokemonId: Int) throws -> Void
}

class DeletePokemonFromCollectionUseCase: DeletePokemonFromCollectionUseCaseProtocol {
    @Injected private var collectonRepository: CollectionRepository

    func invoke(pokemonId: Int) throws {
        try collectonRepository.removePokemon(pokemonId: pokemonId)
    }
}
