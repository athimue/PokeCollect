//
//  HomeView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State var isLoaded = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("POKECOLLECT")
                .font(.system(size: 30, weight: .bold, design: .monospaced))
                .foregroundStyle(.red)
                .padding(10)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
            List {
                Text("POKEMONS")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    .listRowSeparator(.hidden)
                ForEach(viewModel.homeUiModel.generations.sorted { $0.name < $1.name }) { generation in
                    DisclosureGroup {
                        ForEach(generation.pokemons) {
                            pokemon in
                            HStack(spacing: 2) {
                                URLImage(url: pokemon.image, defaultImage: "photo", size: 60)
                                VStack {
                                    Text(String(format: "N° %04d", pokemon.id))
                                    Text(pokemon.name)
                                    HStack {
                                        ForEach(pokemon.types) {
                                            type in
                                            HStack {
                                                URLImage(url: type.image, defaultImage: "photo", size: 20)
                                                Text(type.name)
                                            }
                                        }
                                    }
                                }.frame(maxWidth: .infinity)
                            }
                        }
                    }
                    label: {
                        Text(generation.name).fontDesign(.monospaced)
                    }
                }
                Text("TYPES")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    .listRowSeparator(.hidden)
                ForEach(viewModel.homeUiModel.types) { type in
                    HStack {
                        URLImage(url: type.image, defaultImage: "photo", size: 20)
                        Text(type.name)
                    }
                }
            }.listStyle(.plain)
        }.frame(maxWidth: .infinity)
    }
}
