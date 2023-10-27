//
//  TeamView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import SwiftUI

struct TeamView: View {
    
    @ObservedObject var viewModel: TeamViewModel = TeamViewModel()

    var body: some View {
        VStack {
            Text("MY TEAM")
                .font(.system(size: 30, weight: .bold, design: .monospaced))
                .foregroundStyle(.red)
                .padding(10)
                .frame(maxWidth: .infinity)
            Text(String(viewModel.teamUiModel.team.count))
                .font(.system(size: 30, weight: .bold, design: .monospaced))
                .foregroundStyle(.red)
                .padding(10)
                .frame(maxWidth: .infinity)
            Button("Add pokemon") {
                viewModel.addPokemon(pokemonId: 1)
            }
            HStack {
                VStack {
                    Text("POKEMON 1")
                }.frame(maxWidth: .infinity)
                VStack {
                    Text("POKEMON 2")
                }.frame(maxWidth: .infinity)
            }.frame(maxWidth: .infinity)
            HStack {
                VStack {
                    Text("POKEMON 3")
                }.frame(maxWidth: .infinity)
                VStack {
                    Text("POKEMON 4")
                }.frame(maxWidth: .infinity)
            }.frame(maxWidth: .infinity)
            HStack {
                VStack {
                    Text("POKEMON 5")
                }.frame(maxWidth: .infinity)
                VStack {
                    Text("POKEMON 6")
                }.frame(maxWidth: .infinity)
            }.frame(maxWidth: .infinity)
        }.onAppear {
            viewModel.loadTeam()
        }
    }
}
