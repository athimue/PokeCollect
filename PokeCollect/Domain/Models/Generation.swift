//
//  Generation.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Foundation

struct Generation: Codable, Hashable, Identifiable {
    var id = UUID()
    let name: String
    let pokemons: [Pokemon]
}
