//
//  SearchView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel = .init()
    @State private var textInput: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("Search")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    .listRowSeparator(.hidden)
                SearchBarView(query: $textInput, onSearch: { viewModel.search(query: textInput) })
                    .padding()
                List {
                    ForEach(viewModel.uiModel.result) { pokemon in
                        PokemonListItemView(pokemon: pokemon, onTeamAdd: {
                            viewModel.addPokemonToTeam(pokemonId: pokemon.id)
                        }, onCollectionAdd: {
                            viewModel.addPokemonToCollection(pokemonId: pokemon.id)
                        }, isTeamBtnDisplayed: true, isColletionBtnDisplayed: true)
                    }
                }.listStyle(.plain)
            }
        }
    }
}
