//
//  ApiPreEvolution.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//
import Foundation

enum APIPreEvolutionUnion: Codable {
    case apiPreEvolutionClass(APIPreEvolutionDto)
    case enumeration(APIPreEvolutionEnum)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(APIPreEvolutionEnum.self) {
            self = .enumeration(x)
            return
        }
        if let x = try? container.decode(APIPreEvolutionDto.self) {
            self = .apiPreEvolutionClass(x)
            return
        }
        throw DecodingError.typeMismatch(APIPreEvolutionUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for APIPreEvolutionUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
            case .apiPreEvolutionClass(let x):
                try container.encode(x)
            case .enumeration(let x):
                try container.encode(x)
        }
    }
}

class APIPreEvolutionDto: Codable {
    let name: String
    let pokedexIdd: Int

    init(name: String, pokedexIdd: Int) {
        self.name = name
        self.pokedexIdd = pokedexIdd
    }
}

enum APIPreEvolutionEnum: String, Codable {
    case none
}
