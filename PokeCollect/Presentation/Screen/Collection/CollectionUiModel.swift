//
//  CollectionUiModel.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 06/11/2023.
//

import Foundation

struct CollectionUiModel: Identifiable {
    let id = UUID()
    var isLoading = true
    var collection : [Pokemon] = []
}
