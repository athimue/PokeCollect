//
//  SearchView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import SimpleToast
import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel = .init()
    @State private var textInput: String = ""

    var body: some View {
        let toastOptions = SimpleToastOptions(hideAfter: 2)

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
        }.simpleToast(isPresented: $viewModel.uiModel.showSuccessToast, options: toastOptions) {
            Label("Pokemon added", systemImage: "checkmark.seal")
                .padding()
                .background(Color.green.opacity(0.8))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding(.top)
        }.simpleToast(isPresented: $viewModel.uiModel.showErrorToast, options: toastOptions) {
            Label("Error during addition", systemImage: "lock")
                .padding()
                .background(Color.red.opacity(0.8))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding(.top)
        }
    }
}
