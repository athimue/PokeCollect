//
//  HomeViewModel.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import Foundation
import Resolver
import Combine

protocol HomeViewModelProtocol: ObservableObject {
    var pokemons : [Pokemon] { get }
    var error: Error? { get }
    func loadData()
}

class HomeViewModel: HomeViewModelProtocol {

    @Injected private var getPopularPokemonUseCase : GetPopularPokemonUseCaseProtocol
    
    @Published var pokemons: [Pokemon] = []
    @Published var error: Error?
    
    public func loadData() {
        getPopularPokemonUseCase.invoke { result in
            switch result {
                case .success(let pokemons):
                    print(pokemons)
                    self.pokemons = pokemons
                case .failure(let error):
                    self.error = error
                    print(error)
            }
        }
    }
}
