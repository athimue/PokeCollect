//
//  TypeDto.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 19/10/2023.
//

import Foundation

class TypeDetailDto: Codable {
    let id: Int
    let name: String
    let image: String
    let englishName: String
    
    init(id: Int, name: String, image: String, englishName: String) {
        self.id = id
        self.name = name
        self.image = image
        self.englishName = englishName
    }
}
