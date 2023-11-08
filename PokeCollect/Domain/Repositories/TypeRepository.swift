//
//  TypeRepository.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Combine
import Foundation

protocol TypeRepository {
    func fetchTypes() -> AnyPublisher<[Type], Error>
}
