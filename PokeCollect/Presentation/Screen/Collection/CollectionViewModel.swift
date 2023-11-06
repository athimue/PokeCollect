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
    
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var uiModel = CollectionUiModel()
    
    init() {
        getCollectionUseCase.invoke()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { collection in
                    self.uiModel.collection = collection
                })
            .store(in: &cancellables)
    }
    
    func removePokemonFromCollectiob(pokemonId: Int) {
    }
}
