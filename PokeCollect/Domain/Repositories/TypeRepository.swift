//
//  TypeRepository.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Foundation
import Combine

protocol TypeRepository {
    func fetchTypes() -> AnyPublisher<[Type], Error>
}
