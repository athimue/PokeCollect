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
                            AsyncImage(url: URL(string: type.image)) {
                                phase in
                                switch phase {
                                    case .success(let image):
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: typeSize, maxHeight: typeSize)
                                    default:
                                        Image(systemName: "photo")
                                            .frame(width: typeSize, height: typeSize)
                                }
                            }
                        }
                    }
                }
                AsyncImage(url: URL(string: pokemon.image)) {
                    phase in
                    switch phase {
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: pokemonSize, maxHeight: pokemonSize)
                        default:
                            Image(systemName: "photo")
                                .frame(width: pokemonSize, height: pokemonSize)
                    }
                }
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
