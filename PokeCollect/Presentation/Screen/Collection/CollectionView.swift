//
//  CollectionView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 19/10/2023.
//

import SwiftUI

struct CollectionView: View {
    
    @StateObject var viewModel = CollectionViewModel()
    
    var body: some View {
        VStack {
            Text("COLLECTION")
                .font(.system(size: 20, weight: .bold, design: .monospaced))
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
            ForEach(viewModel.uiModel.collection) { pokemon in
                HStack {
                    Text(String(pokemon.id))
                }
            }
        }
    }
}
