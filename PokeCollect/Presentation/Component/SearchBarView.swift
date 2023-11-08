//
//  SearchBar.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 06/11/2023.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var query: String
    var onSearch: () -> Void

    var body: some View {
        HStack {
            TextField("Search", text: $query, onCommit: {
                onSearch()
            })
            .padding(7)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 10)

            Button(action: {
                onSearch()
            }) {
                Image(systemName: "magnifyingglass")
                    .imageScale(.medium)
                    .padding(7)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
        }
    }
}
