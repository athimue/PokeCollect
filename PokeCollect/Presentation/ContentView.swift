//
//  ContentView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            TeamView()
                .tabItem {
                    Image(systemName: "archivebox.fill")
                    Text("Team")
                }
            CollectionView()
                .tabItem {
                    Image(systemName: "list.star")
                    Text("Collection")
                }
        }
    }
}

#Preview {
    ContentView()
}
