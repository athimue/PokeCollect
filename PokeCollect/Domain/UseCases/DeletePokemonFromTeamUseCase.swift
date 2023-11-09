//
//  DeletePokemonFromTeamUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 08/11/2023.
//

import Foundation
import Resolver

protocol DeletePokemonFromTeamUseCaseProtocol {
    func invoke(pokemonId: Int) -> Bool
}

class DeletePokemonFromTeamUseCase: DeletePokemonFromTeamUseCaseProtocol {
    @Injected private var teamDao: TeamDao

    func invoke(pokemonId: Int) -> Bool {
        teamDao.removePokemon(pokemonId: pokemonId)
    }
}
