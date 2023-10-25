//
//  GetFirstGenerationPokemonsUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import Foundation
import Resolver

protocol GetGenerationPokemonsUseCaseProtocol {
    func invoke(generation: Int, completion: @escaping (Result<[Pokemon], Error>) -> Void)
}


class GetGenerationPokemonsUseCase : GetGenerationPokemonsUseCaseProtocol {
    
    @Injected private var pokemonRepository: PokemonRepositoryProtocol
    
    func invoke(generation: Int, completion: @escaping (Result<[Pokemon], Error>) -> Void){
        return pokemonRepository.fetchPokemonGeneration(generation: generation, completion: completion)
    }
}
