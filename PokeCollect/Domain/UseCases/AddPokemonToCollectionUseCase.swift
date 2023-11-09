//
//  AddPokemonToCollectionUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 06/11/2023.
//

import Foundation
import Resolver

protocol AddPokemonToCollectionUseCaseProtocol {
    func invoke(pokemonId: Int) -> Bool
}

class AddPokemonToCollectionUseCase: AddPokemonToCollectionUseCaseProtocol {
    @Injected private var collectionRepository: CollectionRepository

    func invoke(pokemonId: Int) -> Bool {
        collectionRepository.addPokemon(pokemonId: pokemonId)
    }
}
