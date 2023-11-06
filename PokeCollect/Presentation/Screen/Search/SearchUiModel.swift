//
//  SearchUiModel.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 06/11/2023.
//

import Foundation

struct SearchUiModel: Identifiable {
    let id = UUID()
    var result : [SearchResultModel] = []
}
