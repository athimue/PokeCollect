//
//  PokemonEntity.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Foundation
import GRDB

struct TeamMember: Identifiable, Codable, PersistableRecord, EncodableRecord, FetchableRecord {
    var id: Int64?
    var pokemonId: Int
    var name: String
}

extension TeamMember : TableRecord {
    static var databaseTableName: String { "team" }
}
