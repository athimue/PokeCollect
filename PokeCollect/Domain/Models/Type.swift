//
//  Type.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 19/10/2023.
//

import Foundation

struct ElementType: Codable, Hashable, Identifiable {
    var id = UUID()
    let name: String
    let image: String
    let englishName: String
}
