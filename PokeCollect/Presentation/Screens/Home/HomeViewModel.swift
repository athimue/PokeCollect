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
    var homeUiModel : [HomeUiModel] { get }
    var types : [Type] { get }
    var error: Error? { get }
    func loadData()
}

class HomeViewModel: HomeViewModelProtocol {
    
    @Injected private var getGenerationPokemonsUseCase : GetGenerationPokemonsUseCaseProtocol
    @Injected private var getTypesUseCase : GetTypesUseCaseProtocol
    
    @Published var homeUiModel: [HomeUiModel] = []
    @Published var types: [Type] = []
    @Published var error: Error?
    
    public func loadData() {
        self.homeUiModel = []
        getGenerationPokemonsUseCase.invoke(generation : 1) { result in
            switch result {
                case .success(let pokemons):
                    DispatchQueue.main.async {
                        self.homeUiModel.append(HomeUiModel(name: "Generation 1", pokemons: pokemons))
                    }
                case .failure(let error):
                    self.error = error
                    print(error)
            }
        }
        getGenerationPokemonsUseCase.invoke(generation : 2) { result in
            switch result {
                case .success(let pokemons):
                    DispatchQueue.main.async {
                        self.homeUiModel.append(HomeUiModel(name: "Generation 2", pokemons: pokemons))
                    }
                case .failure(let error):
                    self.error = error
                    print(error)
            }
        }
        getGenerationPokemonsUseCase.invoke(generation : 3) { result in
            switch result {
                case .success(let pokemons):
                    DispatchQueue.main.async {
                        self.homeUiModel.append(HomeUiModel(name: "Generation 3", pokemons: pokemons))
                    }
                case .failure(let error):
                    self.error = error
                    print(error)
            }
        }
        getGenerationPokemonsUseCase.invoke(generation : 4) { result in
            switch result {
                case .success(let pokemons):
                    DispatchQueue.main.async {
                        self.homeUiModel.append(HomeUiModel(name: "Generation 4", pokemons: pokemons))
                    }
                case .failure(let error):
                    self.error = error
                    print(error)
            }
        }
        getGenerationPokemonsUseCase.invoke(generation : 5) { result in
            switch result {
                case .success(let pokemons):
                    DispatchQueue.main.async {
                        self.homeUiModel.append(HomeUiModel(name: "Generation 5", pokemons: pokemons))
                    }
                case .failure(let error):
                    self.error = error
                    print(error)
            }
        }
        getGenerationPokemonsUseCase.invoke(generation : 6) { result in
            switch result {
                case .success(let pokemons):
                    DispatchQueue.main.async {
                        self.homeUiModel.append(HomeUiModel(name: "Generation 6", pokemons: pokemons))
                    }
                case .failure(let error):
                    self.error = error
                    print(error)
            }
        }
        getGenerationPokemonsUseCase.invoke(generation : 7) { result in
            switch result {
                case .success(let pokemons):
                    DispatchQueue.main.async {
                        self.homeUiModel.append(HomeUiModel(name: "Generation 7", pokemons: pokemons))
                    }
                case .failure(let error):
                    self.error = error
                    print(error)
            }
        }
        getGenerationPokemonsUseCase.invoke(generation : 8) { result in
            switch result {
                case .success(let pokemons):
                    DispatchQueue.main.async {
                        self.homeUiModel.append(HomeUiModel(name: "Generation 8", pokemons: pokemons))
                    }
                case .failure(let error):
                    self.error = error
                    print(error)
            }
        }
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
}
