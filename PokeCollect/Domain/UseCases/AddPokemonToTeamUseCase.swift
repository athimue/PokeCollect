//
//  AddPokemonToTeamUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 27/10/2023.
//

import Foundation
import Resolver

protocol AddPokemonToTeamUseCaseProtocol {
    func invoke(pokemonId: Int) -> Bool
}

class AddPokemonToTeamUseCase: AddPokemonToTeamUseCaseProtocol {
    @Injected private var teamRepository: TeamRepository

    func invoke(pokemonId: Int) -> Bool {
        return teamRepository.addPokemon(pokemonId: pokemonId)
    }
}
