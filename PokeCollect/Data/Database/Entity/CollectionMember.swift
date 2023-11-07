//
//  CollectionEntity.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Foundation
import GRDB

struct CollectionMember: Codable, PersistableRecord, EncodableRecord, FetchableRecord {
    var pokemonId: Int
}

extension CollectionMember : TableRecord {
    static var databaseTableName: String { "collection" }
}

