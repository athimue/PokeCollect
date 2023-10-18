//
//  ApiTypesDto.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import Foundation
import OptionallyDecodable

class ApiTypeDto: Codable {
    let name: String?
    let image: String
    
    init(name: String?, image: String) {
        self.name = name
        self.image = image
    }
}
