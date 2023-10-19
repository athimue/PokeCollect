//
//  ApiTypesDto.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import Foundation
import OptionallyDecodable

class ApiTypeDto: Codable {
    let name: String
    let image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}

extension ApiTypeDto {
    var toType: Type { Type(name: self.name, image: self.image, englishName: "")}
}
