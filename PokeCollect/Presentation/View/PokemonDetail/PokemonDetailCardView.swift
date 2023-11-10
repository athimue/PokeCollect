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
                        ResistancesView(resistances: pokemon.resistances)
                        Divider()
                        EvolutionView(preEvolution: pokemon.preEvolution, evolutions: pokemon.evolutions)
                    }
                    .padding()
                }.listStyle(.plain)
            )
        }
    }
}
