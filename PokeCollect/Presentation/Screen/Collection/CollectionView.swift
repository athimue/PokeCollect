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
            Text("COLLECTION")
                .font(.system(size: 20, weight: .bold, design: .monospaced))
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
            if viewModel.uiModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                Divider()
                Text("TOTAL : \(viewModel.uiModel.collection.count) POKEMON")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .padding(10)
                    .frame(maxWidth: .infinity)
                Divider()
                ZStack(alignment: .bottomTrailing) {
                    List {
                        ForEach(viewModel.uiModel.collection) { pokemon in
                            HStack(spacing: 2) {
                                AsyncImage(url: URL(string: pokemon.image)) {
                                    phase in
                                    switch phase {
                                        case .success(let image):
                                            image.resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 60, maxHeight: 60)
                                        default:
                                            Image(systemName: "photo")
                                                .frame(width: 60, height: 60)
                                    }
                                }
                                VStack {
                                    Text(String(format: "N° %04d", pokemon.id))
                                    Text(pokemon.name)
                                    HStack {
                                        ForEach(pokemon.types) {
                                            type in
                                            HStack {
                                                AsyncImage(url: URL(string: type.image)) {
                                                    phase in
                                                    switch phase {
                                                        case .success(let image):
                                                            image.resizable()
                                                                .aspectRatio(contentMode: .fit)
                                                                .frame(maxWidth: 20, maxHeight: 20)
                                                        default:
                                                            Image(systemName: "photo")
                                                                .frame(width: 20, height: 20)
                                                    }
                                                }
                                                Text(type.name)
                                            }
                                        }
                                    }
                                }.frame(maxWidth: .infinity)
                            }.swipeActions {
                                Button (action: { viewModel.removePokemonFromCollection(pokemonId: pokemon.id) }) {
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
