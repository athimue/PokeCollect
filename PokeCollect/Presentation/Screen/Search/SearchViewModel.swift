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

class SearchViewModel : ObservableObject {
    
    @Injected private var getSearchUseCase: GetSearchUseCaseProtocol
    @Injected private var addPokemonToTeam: AddPokemonToTeamUseCaseProtocol
    @Injected private var addPokemonToCollection: AddPokemonToCollectionUseCaseProtocol
    
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var uiModel = SearchUiModel()
    
    func search(query: String) -> Void {
        getSearchUseCase.invoke(query: query)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { result in
                    self.uiModel.result = result.map { result in SearchResultModel(id: result.id, name: result.name, image: result.image, types: result.types)}
                })
            .store(in: &cancellables)
    }
    
    func addPokemonToCollection(pokemonId: Int) {
        do  { try addPokemonToCollection.invoke(pokemonId: pokemonId)}
        catch {
            print(error)
        }
    }
    
    func addPokemonToTeam(pokemonId: Int) {
        do {
            try addPokemonToTeam.invoke(pokemonId: pokemonId)
        } catch {
            print(error)
        }
    }
}