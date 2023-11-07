//
//  GetTypesUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 19/10/2023.
//

import Combine
import Foundation
import Resolver

protocol GetTypesUseCaseProtocol {
    func invoke() -> AnyPublisher<[Type], Error>
}

class GetTypesPokemonsUseCase: GetTypesUseCaseProtocol {
    @Injected private var typeRepository: TypeRepository

    func invoke() -> AnyPublisher<[Type], Error> {
        return typeRepository.fetchTypes()
    }
}
