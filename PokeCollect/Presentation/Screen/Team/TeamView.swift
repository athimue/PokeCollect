//
//  TeamView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import GRDB
import SwiftUI

struct TeamView: View {
    @StateObject var viewModel = TeamViewModel()

    var body: some View {
        VStack {
            Text("MY TEAM")
                .font(.system(size: 20, weight: .bold, design: .monospaced))
                .padding(10)
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity)
            VStack {
                if viewModel.uiModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    HStack {
                        VStack {
                            Text(viewModel.uiModel.team[0].name)
                        }.frame(maxWidth: .infinity)
                        VStack {
                            Text(viewModel.uiModel.team[1].name)
                        }.frame(maxWidth: .infinity)
                    }.frame(maxWidth: .infinity, maxHeight: 100)
                    HStack {
                        VStack {
                            Text(viewModel.uiModel.team[2].name)
                        }.frame(maxWidth: .infinity)
                        VStack {
                            Text(viewModel.uiModel.team[3].name)
                        }.frame(maxWidth: .infinity)
                    }.frame(maxWidth: .infinity, maxHeight: 100)
                    HStack {
                        VStack {
                            Text(viewModel.uiModel.team[4].name)
                        }.frame(maxWidth: .infinity)
                        VStack {
                            Text(viewModel.uiModel.team[5].name)
                        }.frame(maxWidth: .infinity)
                    }.frame(maxWidth: .infinity, maxHeight: 100)
                }
            }.frame(maxHeight: .infinity)
                
        }
    }
}
