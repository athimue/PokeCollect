//
//  GetTeamUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 27/10/2023.
//

import Combine
import Foundation
import Resolver

protocol GetTeamUseCaseProtocol {
    func invoke() -> AnyPublisher<[Pokemon], Error>
}

class GetTeamUseCase: GetTeamUseCaseProtocol {
    
    @Injected private var teamRepository: TeamRepository
    
    func invoke() -> AnyPublisher<[Pokemon], Error> {
        return teamRepository.getTeam()
    }
}
