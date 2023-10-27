//
//  AddPokemonToTeamUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 27/10/2023.
//

import Foundation
import Resolver

protocol AddPokemonToTeamUseCaseProtocol {
    func invoke(pokemonId: Int) throws -> Void
}

class AddPokemonToTeamUseCase : AddPokemonToTeamUseCaseProtocol {
    
    @Injected private var teamRepository: TeamRepository
    
    func invoke(pokemonId: Int) throws -> Void{
        try teamRepository.addPokemon(pokemonId: pokemonId)
    }
}
