//
//  PokemonEntity.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import GRDB

struct PokemonEntity: Codable, FetchableRecord, PersistableRecord {
    var id: Int64
}
