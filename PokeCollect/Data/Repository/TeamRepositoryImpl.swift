//
//  TeamRepositoryImpl.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Foundation
import Resolver
import Combine

struct TeamRepositoryImpl: TeamRepository {
    @Injected private var teamDao: TeamDao
    
    func getTeam() -> AnyPublisher<[Pokemon], Error> {
        teamDao.getTeam().map { typeDtoArray in typeDtoArray.map { typeDto in Type(name: typeDto.name, image: typeDto.image, englishName: typeDto.englishName) }
        }.eraseToAnyPublisher()
    }
}
