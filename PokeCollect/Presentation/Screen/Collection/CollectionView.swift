//
//  CollectionView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 19/10/2023.
//

import SwiftUI

struct CollectionView: View {
    @Binding var tabSelection: Int
    @StateObject var viewModel = CollectionViewModel()

    var body: some View {
        VStack {
            SubTitleView(subTitle: "COLLECTION")
            if viewModel.uiModel.isLoading {
                LoaderView()
            } else {
                Divider()
                SubTitleView(subTitle: "TOTAL : \(viewModel.uiModel.collection.count) POKEMON")
                Divider()
                ZStack(alignment: .bottomTrailing) {
                    List {
                        ForEach(viewModel.uiModel.collection) { pokemon in
                            PokemonListItemView(
                                pokemon: pokemon,
                                onTeamAdd: {},
                                onCollectionAdd: {},
                                isTeamBtnDisplayed: false,
                                isColletionBtnDisplayed: false).swipeActions {
                                Button(action: { viewModel.removePokemonFromCollection(pokemonId: pokemon.id) }) {
                                    Label("Delete", systemImage: "trash.fill")
                                }
                                .tint(.red)
                            }
                        }
                    }.listStyle(.plain)
                    Button {
                        tabSelection = Screen.SEARCH.rawValue
                    } label: {
                        Image(systemName: "plus")
                            .font(.title.weight(.semibold))
                            .padding()
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 4, x: 0, y: 4)
                    }
                    .padding()
                }
            }
        }
    }
}
