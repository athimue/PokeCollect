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
    @Injected private var addPokemonToTeamUseCase: AddPokemonToTeamUseCaseProtocol
    @Injected private var getSuggestionUseCase: GetSuggestionUseCaseProtocol
    @Injected private var getDefensiveCoverageUseCase: GetDefensiveCoverageUseCaseProtocol

    private var cancellables: Set<AnyCancellable> = []

    @Published var uiModel: TeamUiModel = .init()

    init() {
        getTeamUseCase.invoke()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { pokemonTeam in
                    self.uiModel.team = pokemonTeam
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
                            self.uiModel.suggestion = pokemonTeam
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
            self.uiModel.isLoading = false
        }
    }

    func addPokemon(pokemonId: Int) {
        if addPokemonToTeamUseCase.invoke(pokemonId: pokemonId) {
            print("retourne false")
        } else {
            print("retourne true")
        }
    }
}
