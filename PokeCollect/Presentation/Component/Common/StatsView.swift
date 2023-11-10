//
//  StatsView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 10/11/2023.
//

import SwiftUI

struct StatsView: View {
    
    let statistics : [Statistic]
    
    var body: some View {
        Text("Stats")
            .font(.title)
            .fontWeight(.semibold)
        HStack {
            ForEach(statistics) { statistic in
                VStack {
                    HStack { Text(statistic.name) }
                    HStack { Text(String(statistic.value)) }
                }.frame(maxWidth: .infinity)
            }
        }.frame(maxWidth: .infinity)
    }
}
