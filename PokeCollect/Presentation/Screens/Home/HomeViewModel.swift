//
//  HomeViewModel.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import Combine
import Foundation
import Resolver

protocol HomeViewModelProtocol: ObservableObject {
    var homeUiModel: [HomeUiModel] { get }
    var types: [Type] { get }
    var error: Error? { get }
    func loadData()
}

class HomeViewModel: HomeViewModelProtocol {
    @Injected private var getGenerationPokemonsUseCase: GetGenerationPokemonsUseCaseProtocol
    @Injected private var getTypesUseCase: GetTypesUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    
    @Published var homeUiModel: [HomeUiModel] = []
    @Published var types: [Type] = []
    @Published var error: Error?
    
    public func loadData() {
        homeUiModel = []
        fetchPokemonsForGeneration(generation: 1)
        fetchPokemonsForGeneration(generation: 2)
        fetchPokemonsForGeneration(generation: 3)
        fetchPokemonsForGeneration(generation: 4)
        fetchPokemonsForGeneration(generation: 5)
        fetchPokemonsForGeneration(generation: 6)
        fetchPokemonsForGeneration(generation: 7)
        fetchPokemonsForGeneration(generation: 8)
        getTypesUseCase.invoke { result in
            switch result {
                case .success(let types):
                    DispatchQueue.main.async {
                        self.types = types
                    }
                case .failure(let error):
                    self.error = error
                    print(error)
            }
        }
    }
    
    func fetchPokemonsForGeneration(generation: Int) {
        getGenerationPokemonsUseCase.invoke(generation: generation)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error)
                }
            }, receiveValue: { pokemons in
                DispatchQueue.main.async {
                    let newHomeUiModel = HomeUiModel(name: "Generation \(generation)", pokemons: pokemons)
                    self.homeUiModel.append(newHomeUiModel)
                }
            })
            .store(in: &cancellables)
    }
}
