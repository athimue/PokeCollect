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
                        Text("Stats")
                            .font(.title)
                            .fontWeight(.semibold)
                        HStack {
                            ForEach(pokemon.stats) { statistic in
                                VStack {
                                    HStack { Text(statistic.name) }
                                    HStack { Text(String(statistic.value)) }
                                }.frame(maxWidth: .infinity)
                            }
                        }.frame(maxWidth: .infinity)
                        Divider()
                        Text("Resistances")
                            .font(.title)
                            .fontWeight(.semibold)
                        VStack {
                            ForEach(pokemon.resistances) { resistance in
                                HStack {
                                    HStack { URLImage(url: resistance.name, defaultImage: "photo", size: 40) }.frame(maxWidth: .infinity)
                                    HStack { Text(String(resistance.damageMultiplier ?? 0)).fontWeight(.semibold) }.frame(maxWidth: .infinity)
                                    HStack { Text(resistance.damageRelation ?? "No value") }.frame(maxWidth: .infinity)
                                }.frame(maxWidth: .infinity)
                            }.frame(maxWidth: .infinity)
                        }
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

// var resistances : [Resistance]
// var evolutions : [Evolution]
// var preEvolutions : Evolution
