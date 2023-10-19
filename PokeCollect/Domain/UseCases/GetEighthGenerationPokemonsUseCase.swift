//
//  GetEighthGenerationPokemonsUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 19/10/2023.
//

import Foundation
import Resolver

protocol GetEighthGenerationPokemonsUseCaseProtocol {
    func invoke(completion: @escaping (Result<[Pokemon], Error>) -> Void)
}


class GetEighthGenerationPokemonsUseCase : GetEighthGenerationPokemonsUseCaseProtocol {
    
    @Injected private var pokemonRepository: PokemonRepositoryProtocol
    
    func invoke(completion: @escaping (Result<[Pokemon], Error>) -> Void){
        return pokemonRepository.fetchPokemonGeneration(generation: 8, completion: completion)
    }
}
