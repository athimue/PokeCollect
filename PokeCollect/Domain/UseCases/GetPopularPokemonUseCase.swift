//
//  GetPopularPokemonUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import Foundation
import Resolver

protocol GetPopularPokemonUseCaseProtocol {
    func invoke(completion: @escaping (Result<[Pokemon], Error>) -> Void)
}


class GetPopularPokemonUseCase : GetPopularPokemonUseCaseProtocol {
    
    @Injected private var pokemonRepository: PokemonRepositoryProtocol
    
    func invoke(completion: @escaping (Result<[Pokemon], Error>) -> Void){
        return pokemonRepository.fetchPopularPokemons(completion: completion)
    }
}
