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
            AsyncImage(url: URL(string: pokemon.image)) {
                phase in
                switch phase {
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 60, maxHeight: 60)
                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                    default:
                        Image(systemName: "photo")
                            .frame(width: 60, height: 60)
                            .foregroundColor(.gray)
                }
            }
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
                                            .foregroundColor(.gray)
                                }
                            }
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

