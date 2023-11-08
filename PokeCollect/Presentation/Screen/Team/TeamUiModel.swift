//
//  TeamUiModel.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 27/10/2023.
//

import Foundation

struct TeamUiModel: Identifiable {
    let id = UUID()
    var isLoading: Bool = true
    var team : [Pokemon] = []
    var suggestion : [Pokemon] = []
    var defensiveCoverage = DefensiveCoverage()
}
