//
//  TeamViewModel.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Foundation
import Resolver
import Combine

class TeamViewModel: ObservableObject {
    
    @Injected private var getTeamUseCase: GetTeamUseCaseProtocol
    @Injected private var addPokemonToTeamUseCase: AddPokemonToTeamUseCaseProtocol
    
    @Published var teamUiModel: TeamUiModel = TeamUiModel()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadTeam()
    }
    
    func loadTeam() {
        getTeamUseCase.invoke()
            .print("coucou")
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .failure(let error):
                        print("Error: \(error)")
                    case .finished:
                        print("Finished")
                }
            }, receiveValue: { [weak self] teams in
                self?.teamUiModel.team = teams
            })
            .store(in: &cancellables)
    }
    
    func addPokemon(pokemonId: Int) {
        do {
            try addPokemonToTeamUseCase.invoke(pokemonId: pokemonId)
        } catch {
            print("add error")
            print(error)
        }
    }
}
