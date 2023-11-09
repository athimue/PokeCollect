//
//  ApiResistance.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import Foundation
import OptionallyDecodable

class ApiResistanceDto: Codable {
    var name: String?
    let damage_multiplier: Double?
    var damage_relation: String?

    init(name: String?, damageMultiplier: Double?, damageRelation: String?) {
        self.name = name
        self.damage_multiplier = damageMultiplier
        self.damage_relation = damageRelation
    }
}
