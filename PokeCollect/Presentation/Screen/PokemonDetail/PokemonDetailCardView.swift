//
//  PokemonDetailCardView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 09/11/2023.
//

import SwiftUI

struct PokemonDetailCardView: View {
    let pokemon: Pokemon?

    var body: some View {
        pokemon.map { pokemon -> AnyView in
            AnyView(VStack {
                URLImage(url: pokemon.image, defaultImage: "photo", size: 200)
                Text(pokemon.name.capitalized)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack {
                    ForEach(pokemon.types) {
                        type in
                        HStack {
                            URLImage(url: type.image, defaultImage: "photo", size: 80)
                            Text(type.name)
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    }
                }
                .padding()
            }
            .padding())
        }
    }
}
