//
//  ResistancesView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 10/11/2023.
//

import SwiftUI

struct ResistancesView: View {
    
    let resistances : [Resistance]
    
    var body: some View {
        Text("Resistances")
            .font(.title)
            .fontWeight(.semibold)
        VStack {
            ForEach(resistances) { resistance in
                HStack {
                    HStack { URLImage(url: resistance.name, defaultImage: "photo", size: 40) }.frame(maxWidth: .infinity)
                    HStack { Text(String(resistance.damageMultiplier ?? 0)).fontWeight(.semibold) }.frame(maxWidth: .infinity)
                    HStack { Text(resistance.damageRelation ?? "No value") }.frame(maxWidth: .infinity)
                }.frame(maxWidth: .infinity)
            }.frame(maxWidth: .infinity)
        }
    }
}
