//
//  GetFirstGenerationPokemonsUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import Foundation
import Resolver

protocol GetFirstGenerationPokemonsUseCaseProtocol {
    func invoke(completion: @escaping (Result<[Pokemon], Error>) -> Void)
}


class GetFirstGenerationPokemonsUseCase : GetFirstGenerationPokemonsUseCaseProtocol {
    
    @Injected private var pokemonRepository: PokemonRepositoryProtocol
    
    func invoke(completion: @escaping (Result<[Pokemon], Error>) -> Void){
        return pokemonRepository.fetchPokemonGeneration(generation: 1, completion: completion)
    }
}
