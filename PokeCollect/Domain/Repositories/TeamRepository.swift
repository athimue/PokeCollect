//
//  TeamRepository.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Foundation
import Combine

protocol TeamRepository {
    func getTeam() -> AnyPublisher<[Pokemon], Error>
}
