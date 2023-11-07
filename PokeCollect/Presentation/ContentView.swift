//
//  ContentView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 0
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }.tag(0)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(1)
            TeamView()
                .tabItem {
                    Image(systemName: "archivebox.fill")
                    Text("Team")
                }.tag(2)
            CollectionView(tabSelection: $tabSelection)
                .tabItem {
                    Image(systemName: "list.star")
                    Text("Collection")
                }.tag(3)
        }
    }
}

#Preview {
    ContentView()
}
