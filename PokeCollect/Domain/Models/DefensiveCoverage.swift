//
//  DefensiveCoverage.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 08/11/2023.
//

import Foundation

struct DefensiveCoverage {
    var summary: String = ""
    var defensiveTypes: [DefensiveType] = []
}

struct DefensiveType: Identifiable {
    var id = UUID()
    var name: String
    var result: String
    var image: String
}
