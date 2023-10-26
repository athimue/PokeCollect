//
//  HomeViewModel.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import Combine
import Foundation
import Resolver

class HomeViewModel: ObservableObject {
    
    @Injected private var getGenerationPokemonsUseCase: GetGenerationPokemonsUseCaseProtocol
    @Injected private var getTypesUseCase: GetTypesUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    
    @Published var homeUiModel: HomeUiModel = HomeUiModel()
    @Published var error: Error?
    
    public func loadData() {
        homeUiModel.generations = []
        fetchPokemonsForGeneration(generation: 1)
        fetchPokemonsForGeneration(generation: 2)
        fetchPokemonsForGeneration(generation: 3)
        fetchPokemonsForGeneration(generation: 4)
        fetchPokemonsForGeneration(generation: 5)
        fetchPokemonsForGeneration(generation: 6)
        fetchPokemonsForGeneration(generation: 7)
        fetchPokemonsForGeneration(generation: 8)
        fetchTypes()
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
                    self.homeUiModel.generations.append(Generation(name: "Generation \(generation)", pokemons: pokemons))
                }
            })
            .store(in: &cancellables)
    }
    
    func fetchTypes() {
        getTypesUseCase.invoke().sink(receiveCompletion: { completion in
            switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
            }
        }, receiveValue: { types in
            DispatchQueue.main.async {
                self.homeUiModel.types = types
            }
        })
        .store(in: &cancellables)
    }
}
