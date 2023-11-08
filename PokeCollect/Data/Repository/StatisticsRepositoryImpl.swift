//
//  StatisticsRepositoryImpl.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 08/11/2023.
//

import Combine
import Foundation
import Resolver

struct StatisticsRepositoryImpl: StatisticsRepository {
    @Injected private var pokemonAPI: PokemonAPIProtocol

    func getDefensiveCoverage(team: [Pokemon]) -> AnyPublisher<DefensiveCoverage, Error> {
        pokemonAPI.fetchDefensiveCoverage(team: team).map {
            defCoverageDtoArray in
            DefensiveCoverage(
                summary: defCoverageDtoArray[0].summary!,
                defensiveTypes: defCoverageDtoArray.map {
                    defCoverageDto in DefensiveType(name: defCoverageDto.name, result: defCoverageDto.result, image: "https://static.wikia.nocookie.net/pokemongo/images/\(PokemonTranslator.translateType(defCoverageDto.name)).png")
                })

        }.eraseToAnyPublisher()
    }
}
