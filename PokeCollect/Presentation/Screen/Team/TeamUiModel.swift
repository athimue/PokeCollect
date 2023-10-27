//
//  TeamUiModel.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 27/10/2023.
//

import Foundation

struct TeamUiModel: Identifiable {
    let id = UUID()
    var team : [Pokemon] = []
}
