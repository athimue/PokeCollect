//
//  PokemonDetailView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 09/11/2023.
//

import SwiftUI

struct PokemonDetailView: View {
    var pokemonId: Int
    @StateObject var viewModel = PokemonDetailViewModel()
    
    var body: some View {
        VStack {
            if viewModel.uiModel.isLoading {
                LoaderView()
            } else {
                PokemonDetailCardView(pokemon: viewModel.uiModel.pokemon)
            }
        }
        .onAppear {
            viewModel.loadPokemon(pokemonId: pokemonId)
        }
    }
}
