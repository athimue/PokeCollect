//
//  EvolutionView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 10/11/2023.
//

import SwiftUI

struct EvolutionView: View {
    
    let preEvolution : Evolution?
    let evolutions : [Evolution]
    
    var body: some View {
        Text("Evolution")
            .font(.title)
            .fontWeight(.semibold)
        HStack {
            VStack {
                Text("Pre Evolution")
                HStack {
                    if preEvolution != nil {
                        Text(String(preEvolution?.pokedexId ?? 0))
                        Text(preEvolution?.name ?? "")
                    } else {
                        Text("No Evolution")
                    }
                }
            }.frame(maxWidth: .infinity)
            VStack {
                Text("Evolution")
                if evolutions.count > 0 {
                    ForEach(evolutions) { evolution in
                        HStack {
                            Text(String(evolution.pokedexId))
                            Text(evolution.name)
                        }
                    }
                } else {
                    Text("No Evolution")
                }
            }.frame(maxWidth: .infinity)
        }.frame(maxWidth: .infinity)
    }
}
