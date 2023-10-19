//
//  HomeUiModel.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 19/10/2023.
//

import Foundation

struct HomeUiModel: Identifiable{
    let id = UUID()
    let name : String
    let pokemons : [Pokemon]
}
