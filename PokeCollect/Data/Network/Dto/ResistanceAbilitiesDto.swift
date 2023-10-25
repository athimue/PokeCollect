//
//  ResistanceModifyingAbilitiesForAPIUnion.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import Foundation

enum ResistanceModifyingAbilitiesForAPIUnion: Codable {
    case anythingArray([String])
    case resistanceModifyingAbilitiesForAPIClass(ResistanceAbilitiesDto)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .anythingArray(x)
            return
        }
        if let x = try? container.decode(ResistanceAbilitiesDto.self) {
            self = .resistanceModifyingAbilitiesForAPIClass(x)
            return
        }
        throw DecodingError.typeMismatch(ResistanceModifyingAbilitiesForAPIUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ResistanceModifyingAbilitiesForAPIUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
            case .anythingArray(let x):
                try container.encode(x)
            case .resistanceModifyingAbilitiesForAPIClass(let x):
                try container.encode(x)
        }
    }
}

class ResistanceAbilitiesDto: Codable {
    let name, slug: String

    init(name: String, slug: String) {
        self.name = name
        self.slug = slug
    }
}
