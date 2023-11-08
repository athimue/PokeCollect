//
//  GetStatisticsUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 08/11/2023.
//

import Foundation
import Combine
import Resolver

protocol GetDefensiveCoverageUseCaseProtocol {
    func invoke(team: [Pokemon]) -> AnyPublisher<DefensiveCoverage, Error>
}

class GetDefensiveCoverageUseCase : GetDefensiveCoverageUseCaseProtocol {
    @Injected private var statisticsRepository : StatisticsRepository
    
    func invoke(team: [Pokemon]) -> AnyPublisher<DefensiveCoverage, Error> {
        statisticsRepository.getDefensiveCoverage(team: team)
    }
    
}
