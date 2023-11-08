//
//  StatisticsRepository.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 08/11/2023.
//

import Combine
import Foundation

protocol StatisticsRepository {
    func getDefensiveCoverage(team: [Pokemon]) -> AnyPublisher<DefensiveCoverage, Error>
}
