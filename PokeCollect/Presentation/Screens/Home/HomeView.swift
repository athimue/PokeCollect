//
//  HomeView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel : HomeViewModel = HomeViewModel()
    @State var isLoaded = false
    
    var body: some View {
        VStack {
            if let error = viewModel.error {
                Text(error.localizedDescription)
            } else {
                List(viewModel.pokemons) { pokemon in
                    Text(pokemon.name)
                }
            }
        }.onAppear {
            viewModel.loadData()
        }
    }
}
