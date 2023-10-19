//
//  GetSecondGenerationPokemonUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 19/10/2023.
//

import Foundation
import Resolver

protocol GetSecondGenerationPokemonsUseCaseProtocol {
    func invoke(completion: @escaping (Result<[Pokemon], Error>) -> Void)
}


class GetSecondGenerationPokemonsUseCase : GetSecondGenerationPokemonsUseCaseProtocol {
    
    @Injected private var pokemonRepository: PokemonRepositoryProtocol
    
    func invoke(completion: @escaping (Result<[Pokemon], Error>) -> Void){
        return pokemonRepository.fetchPokemonGeneration(generation: 2, completion: completion)
    }
}
