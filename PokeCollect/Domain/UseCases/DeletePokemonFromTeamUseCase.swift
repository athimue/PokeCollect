//
//  DeletePokemonFromTeamUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 08/11/2023.
//

import Foundation
import Resolver

protocol DeletePokemonFromTeamUseCaseProtocol {
    func invoke(pokemonId: Int) throws -> Void
}

class DeletePokemonFromTeamUseCase: DeletePokemonFromTeamUseCaseProtocol {
    @Injected private var teamDao: TeamDao
    
    func invoke(pokemonId: Int) throws {
        try teamDao.removePokemon(pokemonId: pokemonId)
    }
}
