//
//  SearchRepository.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 06/11/2023.
//

import Combine
import Foundation

protocol SearchRepository {
    func fetchSearch(query: String) -> AnyPublisher<[Pokemon], Error>
}
