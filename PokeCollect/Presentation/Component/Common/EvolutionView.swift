//
//  EvolutionView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 10/11/2023.
//

import SwiftUI

struct EvolutionView: View {
    let preEvolution: Evolution?
    let evolutions: [Evolution]

    var body: some View {
        Text("Evolution")
            .font(.title)
            .fontWeight(.semibold)
        HStack {
            VStack {
                Image(systemName: "arrowshape.turn.up.left.2")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                HStack {
                    if preEvolution != nil {
                        Text(String(preEvolution?.pokedexId ?? 0)).fontWeight(.semibold)
                        Text(preEvolution?.name ?? "").fontWeight(.semibold)
                    } else {
                        Text("No Evolution").fontWeight(.semibold)
                    }
                }.padding()
            }.frame(maxWidth: .infinity)
            VStack {
                Image(systemName: "arrowshape.turn.up.forward")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                if evolutions.count > 0 {
                    ForEach(evolutions) { evolution in
                        HStack {
                            Text(String(evolution.pokedexId)).fontWeight(.semibold)
                            Text(evolution.name).fontWeight(.semibold)
                        }.padding()
                    }
                } else {
                    Text("No Evolution").fontWeight(.semibold).padding()
                }
            }.frame(maxWidth: .infinity)
        }.frame(maxWidth: .infinity)
    }
}
