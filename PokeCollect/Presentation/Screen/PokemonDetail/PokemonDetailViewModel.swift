//
//  PokemonDetailViewModel.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 09/11/2023.
//

import Combine
import Dispatch
import Resolver

class PokemonDetailViewModel: ObservableObject {
    
    @Injected private var getPokemonUseCase: GetPokemonUseCaseProtocol
    
    @Published var uiModel = PokemonDetailUIModel()
    private var cancellables = Set<AnyCancellable>()
    
    func loadPokemon(pokemonId: Int) {
        getPokemonUseCase.invoke(pokemonId: pokemonId)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { pokemon in
                    self.uiModel.pokemon = pokemon
                    self.uiModel.isLoading = false
                })
            .store(in: &cancellables)
    }
}
