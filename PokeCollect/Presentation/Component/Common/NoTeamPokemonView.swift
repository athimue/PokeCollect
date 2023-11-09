//
//  NoTeamPokemonView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 08/11/2023.
//

import SwiftUI

struct NoTeamPokemonView: View {
    var body: some View {
        VStack {
            Image(systemName: "archivebox")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.gray)
            Text("Free slot").frame(maxWidth: .infinity)
        }.aspectRatio(contentMode: .fill)
    }
}
