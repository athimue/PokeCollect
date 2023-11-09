//
//  ContentView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import SwiftUI

enum Screen: Int {
    case HOME = 0
    case SEARCH = 1
    case TEAM = 2
    case COLLECTION = 3
}

struct ContentView: View {
    @State private var tabSelection = Screen.HOME.rawValue
    
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }.tag(Screen.HOME.rawValue)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(Screen.SEARCH.rawValue)
            TeamView()
                .tabItem {
                    Image(systemName: "archivebox.fill")
                    Text("Team")
                }.tag(Screen.TEAM.rawValue)
            CollectionView(tabSelection: $tabSelection)
                .tabItem {
                    Image(systemName: "list.star")
                    Text("Collection")
                }.tag(Screen.COLLECTION.rawValue)
        }
    }
}

#Preview {
    ContentView()
}
