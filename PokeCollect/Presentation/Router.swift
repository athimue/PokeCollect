//
//  Router.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 09/11/2023.
//

import Foundation
import SwiftUI

struct Router : View {
    
    let currentScreen : Screen
    
    enum Screen {
        case pokemondetail(pokemonId: Int)
    }
    
    var body : some View{
        switch currentScreen {
            case .pokemondetail(let pokemonId):
                PokemonDetailView(pokemonId: pokemonId)
        }
    }
}
