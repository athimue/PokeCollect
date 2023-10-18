//
//  StatsDto.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import Foundation
import OptionallyDecodable

class StatsDto: Codable {
    let hp, attack, defense, specialAttack, specialDefense, speed: Int
    
    enum CodingKeys: String, CodingKey {
        case hp = "HP"
        case attack, defense
        case specialAttack = "special_attack"
        case specialDefense = "special_defense"
        case speed
    }
    
    init(hp: Int, attack: Int, defense: Int, specialAttack: Int, specialDefense: Int, speed: Int) {
        self.hp = hp
        self.attack = attack
        self.defense = defense
        self.specialAttack = specialAttack
        self.specialDefense = specialDefense
        self.speed = speed
    }
}
