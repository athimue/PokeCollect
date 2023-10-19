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
    var generations : [HomeUiModel] { get }
    var types : [Type] { get }
    var error: Error? { get }
    func loadData()
}

class HomeViewModel: HomeViewModelProtocol {
    
    @Injected private var getFirstGenerationPokemonsUseCase : GetFirstGenerationPokemonsUseCaseProtocol
    @Injected private var getSecondGenerationPokemonsUseCase : GetSecondGenerationPokemonsUseCaseProtocol
    @Injected private var getThirdGenerationPokemonsUseCase : GetThirdGenerationPokemonsUseCaseProtocol
    @Injected private var getFourthGenerationPokemonsUseCase : GetFourthGenerationPokemonsUseCaseProtocol
    @Injected private var getFifthGenerationPokemonsUseCase : GetFifthGenerationPokemonsUseCaseProtocol
    @Injected private var getSixthGenerationPokemonsUseCase : GetSixthGenerationPokemonsUseCaseProtocol
    @Injected private var getSeventhGenerationPokemonsUseCase : GetSeventhGenerationPokemonsUseCaseProtocol
    @Injected private var getEighthGenerationPokemonsUseCase : GetEighthGenerationPokemonsUseCaseProtocol
    @Injected private var getTypesUseCase : GetTypesUseCaseProtocol
    
    @Published var generations: [HomeUiModel] = []
    @Published var types: [Type] = []
    @Published var error: Error?
    
    public func loadData() {
        self.generations = []
        getFirstGenerationPokemonsUseCase.invoke { result in
            switch result {
                case .success(let pokemons):
                    DispatchQueue.main.async {
                        self.generations.append(HomeUiModel(name: "Generation 1", pokemons: pokemons))
                    }
                case .failure(let error):
                    self.error = error
                    print(error)
            }
        }
        getSecondGenerationPokemonsUseCase.invoke { result in
            switch result {
                case .success(let pokemons):
                    DispatchQueue.main.async {
                        self.generations.append(HomeUiModel(name: "Generation 2", pokemons: pokemons))
                    }
                case .failure(let error):
                    self.error = error
                    print(error)
            }
        }
        getThirdGenerationPokemonsUseCase.invoke { result in
            switch result {
                case .success(let pokemons):
                    DispatchQueue.main.async {
                        self.generations.append(HomeUiModel(name: "Generation 3", pokemons: pokemons))
                    }
                case .failure(let error):
                    self.error = error
                    print(error)
            }
        }
        getFourthGenerationPokemonsUseCase.invoke { result in
            switch result {
                case .success(let pokemons):
                    DispatchQueue.main.async {
                        self.generations.append(HomeUiModel(name: "Generation 4", pokemons: pokemons))
                    }
                case .failure(let error):
                    self.error = error
                    print(error)
            }
        }
        getFifthGenerationPokemonsUseCase.invoke { result in
            switch result {
                case .success(let pokemons):
                    DispatchQueue.main.async {
                        self.generations.append(HomeUiModel(name: "Generation 5", pokemons: pokemons))
                    }
                case .failure(let error):
                    self.error = error
                    print(error)
            }
        }
        getSixthGenerationPokemonsUseCase.invoke { result in
            switch result {
                case .success(let pokemons):
                    DispatchQueue.main.async {
                        self.generations.append(HomeUiModel(name: "Generation 6", pokemons: pokemons))
                    }
                case .failure(let error):
                    self.error = error
                    print(error)
            }
        }
        getSeventhGenerationPokemonsUseCase.invoke { result in
            switch result {
                case .success(let pokemons):
                    DispatchQueue.main.async {
                        self.generations.append(HomeUiModel(name: "Generation 7", pokemons: pokemons))
                    }
                case .failure(let error):
                    self.error = error
                    print(error)
            }
        }
        getEighthGenerationPokemonsUseCase.invoke { result in
            switch result {
                case .success(let pokemons):
                    DispatchQueue.main.async {
                        self.generations.append(HomeUiModel(name: "Generation 8", pokemons: pokemons))
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
