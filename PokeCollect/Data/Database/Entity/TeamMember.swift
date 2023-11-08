//
//  TeamMember.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Foundation
import GRDB

struct TeamMember: Codable, PersistableRecord, EncodableRecord, FetchableRecord, TableRecord {
    var pokemonId: Int

    static var databaseTableName: String { "team" }
}
