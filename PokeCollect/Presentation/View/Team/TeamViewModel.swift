//
//  TeamViewModel.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Combine
import Dispatch
import GRDB
import Resolver

class TeamViewModel: ObservableObject {
    
    @Injected private var getTeamUseCase: GetTeamUseCaseProtocol
    @Injected private var getSuggestionUseCase: GetSuggestionUseCaseProtocol
    @Injected private var getDefensiveCoverageUseCase: GetDefensiveCoverageUseCaseProtocol
    @Injected private var addPokemonToTeamUseCase: AddPokemonToTeamUseCaseProtocol
    @Injected private var deletePokemonFromTeamUseCase: DeletePokemonFromTeamUseCaseProtocol

    private var cancellables: Set<AnyCancellable> = []

    @Published var uiModel = TeamUiModel()

    init() {
        getTeamUseCase.invoke()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { pokemonTeam in
                    self.uiModel.team = pokemonTeam
                        .map { result in PokemonListItemModel(id: result.id, name: result.name, image: result.image, types: result.types) }
                        .sorted { $0.id < $1.id }
                    self.loadData(team: pokemonTeam)
                })
            .store(in: &cancellables)
    }

    func loadData(team: [Pokemon]) {
        if team.count > 0 {
            if team.count < 6 && team.count > 0 {
                getSuggestionUseCase.invoke(team: team)
                    .receive(on: DispatchQueue.main)
                    .sink(
                        receiveCompletion: { completion in
                            switch completion {
                                case .finished:
                                    break
                                case .failure(let error):
                                    print(error)
                            }
                        },
                        receiveValue: { pokemonTeam in
                            self.uiModel.suggestion = pokemonTeam.map { result in PokemonListItemModel(id: result.id, name: result.name, image: result.image, types: result.types) }
                            self.uiModel.isLoading = false
                        })
                    .store(in: &cancellables)
            } else {
                getDefensiveCoverageUseCase.invoke(team: team)
                    .receive(on: DispatchQueue.main)
                    .sink(
                        receiveCompletion: { completion in
                            switch completion {
                                case .finished:
                                    break
                                case .failure(let error):
                                    print(error)
                            }
                        },
                        receiveValue: { defensiveCoverage in
                            self.uiModel.defensiveCoverage = defensiveCoverage
                            self.uiModel.isLoading = false
                        })
                    .store(in: &cancellables)
            }
        } else {
            uiModel.isLoading = false
        }
    }

    func addPokemon(pokemonId: Int) {
        uiModel.isLoading = true
        if addPokemonToTeamUseCase.invoke(pokemonId: pokemonId) {
            print("retourne false")
        } else {
            print("retourne true")
        }
    }

    func removePokemon(pokemonId: Int) {
        do {
            uiModel.isLoading = true
            try deletePokemonFromTeamUseCase.invoke(pokemonId: pokemonId)
        } catch {
            print("error")
        }
    }
}
