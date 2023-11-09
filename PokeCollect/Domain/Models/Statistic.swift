//
//  Stats.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 09/11/2023.
//

import Foundation

struct Statistic: Codable, Hashable, Identifiable {
    var id = UUID()
    var name: String
    var value: Int
}
