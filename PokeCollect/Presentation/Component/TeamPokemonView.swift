//
//  PokemonView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 08/11/2023.
//

import SwiftUI

struct TeamPokemonView: View {
    let pokemon: Pokemon
    let onDelete: () -> Void

    var body: some View {
        let pokemonSize = 80.0
        let typeSize = 20.0
        let pinkColor = Color.pink

        ZStack(alignment: .topTrailing) {
            HStack {
                VStack {
                    Text(String(format: "N° %04d", pokemon.id))
                    Text(pokemon.name)
                    HStack {
                        ForEach(pokemon.types) {
                            type in
                            URLImage(url: type.image, defaultImage: "photo", size: typeSize)
                        }
                    }
                }
                URLImage(url: pokemon.image, defaultImage: "photo", size: pokemonSize)
            }
            Button(action: onDelete) {
                Image(systemName: "minus.circle")
                    .background(pinkColor)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .shadow(radius: 4, x: 0, y: 4)
            }.buttonStyle(BorderlessButtonStyle())
        }
    }
}
