//
//  SubTitleView.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 08/11/2023.
//

import SwiftUI

struct SubTitleView: View {
    let subTitle: String
    var body: some View {
        Text(subTitle)
            .font(.system(size: 20, weight: .bold, design: .monospaced))
            .padding(10)
            .listRowSeparator(.hidden)
            .frame(maxWidth: .infinity)
    }
}
