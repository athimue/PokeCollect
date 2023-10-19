//
//  GetTypesUseCase.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 19/10/2023.
//

import Foundation
import Resolver

protocol GetTypesUseCaseProtocol {
    func invoke(completion: @escaping (Result<[Type], Error>) -> Void)
}


class GetTypesPokemonsUseCase : GetTypesUseCaseProtocol {
    
    @Injected private var typeRepository: TypeRepositoryProtocol
    
    func invoke(completion: @escaping (Result<[Type], Error>) -> Void){
        return typeRepository.fetchTypes(completion: completion)
    }
}

