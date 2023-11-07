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
                SearchBar(query: $textInput, onSearch: {viewModel.search(query: textInput)})
                    .padding()
                List {
                    ForEach(viewModel.uiModel.result) { pokemon in
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
                            VStack {
                                Button(action: {
                                    viewModel.addPokemonToTeam(pokemonId: pokemon.id)
                                }) {
                                    HStack {
                                        Image(systemName: "archivebox.fill")
                                    }
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .cornerRadius(10)
                                }
                                Button(action: {
                                    viewModel.addPokemonToCollection(pokemonId: pokemon.id)
                                }) {
                                    HStack {
                                        Image(systemName: "list.star")
                                    }
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.green)
                                    .cornerRadius(10)
                                }
                            }.buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }.listStyle(.plain)
            }
        }
    }
}
