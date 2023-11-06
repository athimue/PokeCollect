//
//  CollectionRepository.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Foundation
import Resolver
import Combine

struct CollectionRepositoryImpl: CollectionRepository {
    
    @Injected private var collectionDao: CollectionDao
    
    func getCollection() -> AnyPublisher<[Pokemon], Error> {
        collectionDao.getCollection().map { collectionEntityArray in collectionEntityArray.map { collectionEntity in Pokemon(id: collectionEntity.id, name: "", image: "", types: [])}}.eraseToAnyPublisher()
    }
}
