//
//  GetCollectionUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 27/10/2023.
//

import Combine
import Foundation
import Resolver

protocol GetCollectionUseCaseProtocol {
    func invoke() -> AnyPublisher<[Pokemon], Error>
}

class GetCollectionUseCase: GetCollectionUseCaseProtocol {
    @Injected private var collectionRepository: CollectionRepository

    func invoke() -> AnyPublisher<[Pokemon], Error> {
        return collectionRepository.getCollection()
    }
}
