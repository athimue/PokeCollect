//
//  GetSuggestionUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 08/11/2023.
//

import Combine
import Resolver

protocol GetSuggestionUseCaseProtocol  {
    func invoke(team : [Pokemon]) -> AnyPublisher<[Pokemon], Error>
}

class GetSuggestionUseCase : GetSuggestionUseCaseProtocol {
    
    @Injected private var pokemonRepository : PokemonRepository
    
    func invoke(team: [Pokemon]) -> AnyPublisher<[Pokemon], Error> {
        pokemonRepository.fetchSuggestion(team: team)
    }
    
    
}
