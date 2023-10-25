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
    let damageMultiplier: Double?
    var damageRelation: DamageRelation?

    init(name: String?, damageMultiplier: Double?, damageRelation: DamageRelation?) {
        self.name = name
        self.damageMultiplier = damageMultiplier
        self.damageRelation = damageRelation
    }
}

enum DamageRelation: String, Codable {
    case immune
    case neutral
    case resistant
    case twiceResistant = "twice_resistant"
    case twiceVulnerable = "twice_vulnerable"
    case vulnerable
}
