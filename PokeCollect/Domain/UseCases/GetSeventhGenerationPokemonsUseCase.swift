//
//  GetSeventhGenerationPokemonsUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 19/10/2023.
//

import Foundation
import Resolver

protocol GetSeventhGenerationPokemonsUseCaseProtocol {
    func invoke(completion: @escaping (Result<[Pokemon], Error>) -> Void)
}


class GetSeventhGenerationPokemonsUseCase : GetSeventhGenerationPokemonsUseCaseProtocol {
    
    @Injected private var pokemonRepository: PokemonRepositoryProtocol
    
    func invoke(completion: @escaping (Result<[Pokemon], Error>) -> Void){
        return pokemonRepository.fetchPokemonGeneration(generation: 7, completion: completion)
    }
}
