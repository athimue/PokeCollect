//
//  TeamView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import GRDB
import SwiftUI

struct TeamView: View {
    @StateObject var viewModel = TeamViewModel()

    var body: some View {
        let columns = [GridItem(.flexible()), GridItem(.flexible())]
        let titleFont = Font.system(size: 20, weight: .bold, design: .monospaced)

        VStack {
            Text("MY TEAM")
                .font(titleFont)
                .padding(10)
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity)
            Divider()
            VStack {
                if viewModel.uiModel.isLoading {
                    LoaderView()
                } else {
                    if viewModel.uiModel.team.isEmpty {
                        SubTitleView(subTitle: "No pokemon inside the team")
                    } else {
                        LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                            ForEach(0 ..< 6) { index in
                                if index < viewModel.uiModel.team.count {
                                    let pokemon = viewModel.uiModel.team[index]
                                    TeamPokemonView(pokemon: pokemon) {
                                        viewModel.removePokemon(pokemonId: pokemon.id)
                                    }.transition(.move(edge: .trailing))
                                } else {
                                    NoTeamPokemonView().transition(.opacity)
                                }
                            }
                        }.transition(.opacity)
                        Divider()
                        if viewModel.uiModel.team.count < 6 {
                            SubTitleView(subTitle: "Pokemon suggestions to complete your team")
                            List {
                                ForEach(viewModel.uiModel.suggestion) { pokemon in
                                    PokemonListItemView(pokemon: pokemon, onTeamAdd: {
                                        viewModel.addPokemon(pokemonId: pokemon.id)
                                    }, onCollectionAdd: {}, isTeamBtnDisplayed: true, isColletionBtnDisplayed: false)
                                }
                            }.listStyle(.plain)
                        } else {
                            Text("Defensive coverage")
                                .font(.system(size: 20, weight: .bold, design: .monospaced))
                                .padding(10)
                                .listRowSeparator(.hidden)
                                .frame(maxWidth: .infinity)
                            List {
                                VStack {
                                    Text("\(viewModel.uiModel.defensiveCoverage.summary)")
                                        .font(.system(size: 15, weight: .bold, design: .monospaced))
                                        .padding(2)
                                }
                                ForEach(viewModel.uiModel.defensiveCoverage.defensiveTypes) { defensiveType in
                                    HStack {
                                        URLImage(url: defensiveType.image, defaultImage: "photo", size: 20).frame(maxWidth: 130)
                                        VStack {
                                            Text("\(defensiveType.name)")
                                                .fontWeight(.bold)
                                                .fontDesign(.monospaced)
                                                .padding(2)
                                            Text("\(defensiveType.result)")
                                        }.frame(maxWidth: .infinity)
                                    }.frame(maxWidth: .infinity)
                                }
                            }.listStyle(.plain)
                        }
                    }
                }
            }
        }.frame(maxHeight: .infinity)
    }
}
