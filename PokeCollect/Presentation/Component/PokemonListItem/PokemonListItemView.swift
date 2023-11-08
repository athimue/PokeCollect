//
//  PokemonListItemView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 08/11/2023.
//

import SwiftUI

struct PokemonListItemView: View {
    let pokemon: PokemonListItemModel
    let onTeamAdd: () -> Void
    let onCollectionAdd: () -> Void
    let isTeamBtnDisplayed: Bool
    let isColletionBtnDisplayed: Bool

    var body: some View {
        HStack(spacing: 2) {
            URLImage(url: pokemon.image, defaultImage: "photo", size: 60)
            VStack {
                Text(String(format: "N° %04d", pokemon.id))
                    .font(.headline)
                    .foregroundColor(.blue)
                Text(pokemon.name)
                    .foregroundColor(.black)
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
            VStack {
                if isTeamBtnDisplayed {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            onTeamAdd()
                        }
                    }, label: {
                        HStack {
                            Image(systemName: "archivebox.fill")
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                    })
                    .transition(.move(edge: .trailing))
                }
                if isColletionBtnDisplayed {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            onCollectionAdd()
                        }
                    }, label: {
                        HStack {
                            Image(systemName: "list.star")
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                    })
                    .transition(.move(edge: .trailing))
                }
            }.buttonStyle(BorderlessButtonStyle())
        }
    }
}
