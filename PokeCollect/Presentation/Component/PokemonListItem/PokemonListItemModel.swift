//
//  PokemonListItemModel.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 06/11/2023.
//

import Foundation

struct PokemonListItemModel: Identifiable, Hashable {
    var id: Int
    var name: String
    var image: String
    var types: [ElementType]
}
