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
        VStack {
            Text("MY TEAM")
                .font(.system(size: 20, weight: .bold, design: .monospaced))
                .padding(10)
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity)
            VStack {
                if viewModel.uiModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.uiModel.team, id: \.self) { pokemon in
                            HStack {
                                VStack {
                                    Text(String(format: "N° %04d", pokemon.id))
                                    Text(pokemon.name)
                                    HStack {
                                        ForEach(pokemon.types) {
                                            type in
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
                                        }
                                    }
                                }
                                AsyncImage(url: URL(string: pokemon.image)) {
                                    phase in
                                    switch phase {
                                        case .success(let image):
                                            image.resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 80, maxHeight: 80)
                                        default:
                                            Image(systemName: "photo")
                                                .frame(width: 60, height: 60)
                                    }
                                }
                            }
                        }
                    }
                    if viewModel.uiModel.team.count < 6 {
                        Text("Pokemon suggestions to complete your team")
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                            .padding(10)
                            .listRowSeparator(.hidden)
                            .frame(maxWidth: .infinity)
                        List {
                            ForEach(viewModel.uiModel.suggestion) { pokemon in
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
                                            viewModel.addPokemon(pokemonId: pokemon.id)
                                        }) {
                                            HStack {
                                                Image(systemName: "archivebox.fill")
                                            }
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(Color.red)
                                            .cornerRadius(10)
                                        }
                                    }.buttonStyle(BorderlessButtonStyle())
                                }
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
                                    AsyncImage(url: URL(string: defensiveType.image)) {
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
                                    }.frame(maxWidth: 130)
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
        }.frame(maxHeight: .infinity)
    }
}
