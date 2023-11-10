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
            AnyView(
                List {
                    VStack {
                        URLImage(url: pokemon.image, defaultImage: "photo", size: 300)
                        Text(pokemon.name.capitalized)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        HStack {
                            ForEach(pokemon.types) {
                                type in
                                HStack {
                                    URLImage(url: type.image, defaultImage: "photo", size: 80)
                                    Text(type.name)
                                }
                            }
                        }
                        .padding()
                        Divider()
                        StatsView(statistics: pokemon.stats)
                        Divider()
                        ResistanceListView(resistances: pokemon.resistances)
                        Divider()
                        Text("Evolution")
                            .font(.title)
                            .fontWeight(.semibold)
                        HStack {
                            VStack {
                                Text("Pre Evolution")
                                HStack {
                                    if pokemon.preEvolutions != nil {
                                        Text(String(pokemon.preEvolutions?.pokedexId ?? 0))
                                        Text(pokemon.preEvolutions?.name ?? "")
                                    } else {
                                        Text("No Evolution")
                                    }
                                }
                            }.frame(maxWidth: .infinity)
                            VStack {
                                Text("Evolution")
                                if pokemon.evolutions.count > 0 {
                                    ForEach(pokemon.evolutions) { evolution in
                                        HStack {
                                            Text(String(evolution.pokedexId))
                                            Text(evolution.name)
                                        }
                                    }
                                } else {
                                    Text("No Evolution")
                                }
                            }.frame(maxWidth: .infinity)
                        }.frame(maxWidth: .infinity)
                    }
                    .padding()
                }.listStyle(.plain)
            )
        }
    }
}
