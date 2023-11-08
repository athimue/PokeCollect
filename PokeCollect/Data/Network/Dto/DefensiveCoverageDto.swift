//
//  DefensiveCoverage.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 08/11/2023.
//

import Foundation

class DefensiveCoverageDto: Codable {
    let name, result, message: String
    let summary, pokemonDtoClass: String?
    
    enum CodingKeys: String, CodingKey {
        case name, result, message, summary
        case pokemonDtoClass
    }
    
    init(name: String, result: String, message: String, summary: String?, pokemonDtoClass: String?) {
        self.name = name
        self.result = result
        self.message = message
        self.summary = summary
        self.pokemonDtoClass = pokemonDtoClass
    }
}
