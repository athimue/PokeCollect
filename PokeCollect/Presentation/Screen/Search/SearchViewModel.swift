//
//  SearchViewModel.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 06/11/2023.
//

import Combine
import Dispatch
import GRDB
import Resolver

class SearchViewModel: ObservableObject {
    @Injected private var getSearchUseCase: GetSearchUseCaseProtocol
    @Injected private var addPokemonToTeam: AddPokemonToTeamUseCaseProtocol
    @Injected private var addPokemonToCollection: AddPokemonToCollectionUseCaseProtocol
    
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var uiModel = SearchUiModel()
    
    func search(query: String) {
        getSearchUseCase.invoke(query: query)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { result in
                    self.uiModel.result = result.map { result in PokemonListItemModel(id: result.id, name: result.name, image: result.image, types: result.types) }
                })
            .store(in: &cancellables)
    }
    
    func addPokemonToCollection(pokemonId: Int) {
        addPokemonToCollection.invoke(pokemonId: pokemonId) ? (uiModel.showSuccessToast = true) : (uiModel.showErrorToast = true)
    }
    
    func addPokemonToTeam(pokemonId: Int) {
        addPokemonToTeam.invoke(pokemonId: pokemonId) ? (uiModel.showSuccessToast = true) : (uiModel.showErrorToast = true)
    }
}
