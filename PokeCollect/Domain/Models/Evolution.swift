//
//  Evolution.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 09/11/2023.
//

import Foundation

struct Evolution : Codable, Hashable, Identifiable {
    var id = UUID()
    var name: String
    var pokedexId: Int
}
