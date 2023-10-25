//
//  Pokemon.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import Foundation

struct Pokemon: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var image: String
    var types: [Type]
}
