//
//  GetPokemonUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 09/11/2023.
//

import Combine
import Resolver

protocol GetPokemonUseCaseProtocol  {
    func invoke(pokemonId : Int) -> AnyPublisher<Pokemon, Error>
}

class GetPokemonUseCase : GetPokemonUseCaseProtocol {
    
    @Injected private var pokemonRepository : PokemonRepository
    
    func invoke(pokemonId: Int) -> AnyPublisher<Pokemon, Error> {
        pokemonRepository.fetchPokemon(pokemonId: pokemonId)
    }
    
    
}
