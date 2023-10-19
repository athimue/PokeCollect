//
//  GetThirdGenerationPokemonsUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 19/10/2023.
//

import Foundation
import Resolver

protocol GetThirdGenerationPokemonsUseCaseProtocol {
    func invoke(completion: @escaping (Result<[Pokemon], Error>) -> Void)
}


class GetThirdGenerationPokemonsUseCase : GetThirdGenerationPokemonsUseCaseProtocol {
    
    @Injected private var pokemonRepository: PokemonRepositoryProtocol
    
    func invoke(completion: @escaping (Result<[Pokemon], Error>) -> Void){
        return pokemonRepository.fetchPokemonGeneration(generation: 3, completion: completion)
    }
}

