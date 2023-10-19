//
//  Type.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 19/10/2023.
//

import Foundation

struct Type: Codable, Hashable, Identifiable {
    var id = UUID();
    var name: String;
    var image: String;
    var englishName: String;
}
