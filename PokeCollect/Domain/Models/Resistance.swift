//
//  Resistance.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 09/11/2023.
//

import Foundation

struct Resistance : Codable, Hashable, Identifiable {
    var id = UUID()
    var name: String
    var damageMultiplier: Double?
    var damageRelation: String?
}
