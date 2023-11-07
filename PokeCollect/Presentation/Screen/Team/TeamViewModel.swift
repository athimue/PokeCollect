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

    private var cancellables: Set<AnyCancellable> = []

    @Published var uiModel: TeamUiModel = .init()

    init() {
        getTeamUseCase.invoke()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { pokemonTeam in
                    self.uiModel.isLoading = false
                    self.uiModel.team = pokemonTeam
                })
            .store(in: &cancellables)
    }

    func addPokemon(pokemonId: Int) {
        if addPokemonToTeamUseCase.invoke(pokemonId: pokemonId) {
            print("retourne false")
        } else {
            print("retourne true")
        }
    }
}
