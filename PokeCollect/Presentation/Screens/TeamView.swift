//
//  TeamView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import SwiftUI

struct TeamView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("MY TEAM")
                .font(.system(size: 30, weight:.bold, design: .monospaced))
                .foregroundStyle(.red)
                .padding(10)
                .frame(maxWidth:.infinity)
            HStack {
                VStack {
                    Text("POKEMON 1")
                }.frame(maxWidth:.infinity)
                VStack {
                    Text("POKEMON 2")
                }.frame(maxWidth:.infinity)
            }.frame(maxWidth:.infinity)
            HStack {
                VStack {
                    Text("POKEMON 3")
                }.frame(maxWidth:.infinity)
                VStack {
                    Text("POKEMON 4")
                }.frame(maxWidth:.infinity)
            }.frame(maxWidth:.infinity)
            HStack {
                VStack {
                    Text("POKEMON 5")
                }.frame(maxWidth:.infinity)
                VStack {
                    Text("POKEMON 6")
                }.frame(maxWidth:.infinity)
            }.frame(maxWidth:.infinity)
        }
    }
}
