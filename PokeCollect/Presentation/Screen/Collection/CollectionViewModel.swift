//
//  CollectionViewModel.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 06/11/2023.
//

import Combine
import Dispatch
import GRDB
import Resolver

class CollectionViewModel: ObservableObject {
    
    @Injected private var getCollectionUseCase: GetCollectionUseCaseProtocol
    @Injected private var deletePokemonFromCollectionUseCase: DeletePokemonFromCollectionUseCaseProtocol
    
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var uiModel = CollectionUiModel()
    
    init() {
        getCollectionUseCase.invoke()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { pokemons in
                    self.uiModel.collection = pokemons.map { result in PokemonListItemModel(id: result.id, name: result.name, image: result.image, types: result.types) }
                    self.uiModel.isLoading = false
                })
            .store(in: &cancellables)
    }
    
    func removePokemonFromCollection(pokemonId: Int) {
        do {
            self.uiModel.isLoading = true
            try deletePokemonFromCollectionUseCase.invoke(pokemonId: pokemonId)
        } catch {
            print(error)
        }
    }
}
