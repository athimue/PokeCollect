//
//  PokemonEntity.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Foundation
import GRDB

struct TeamEntity: Codable, FetchableRecord, MutablePersistableRecord {
    var id: Int
    
        // Ignorer les propriétés non persistantes
    private enum CodingKeys: String, CodingKey {
        case id
    }
}
