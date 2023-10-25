//
//  EvolutionDto.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import Foundation

class APIEvolutionDto: Codable {
    let name: String
    let pokedexId: Int

    enum CodingKeys: String, CodingKey {
        case name
        case pokedexId
    }

    init(name: String, pokedexId: Int) {
        self.name = name
        self.pokedexId = pokedexId
    }
}
