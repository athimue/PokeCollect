//
//  TypeRepository.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 19/10/2023.
//
import Foundation
import Resolver

protocol TypeRepositoryProtocol {
    
    func fetchTypes(completion: @escaping (Result<[Type], Error>) -> Void)
}

struct TypeRepository: TypeRepositoryProtocol {
    
    @Injected private var pokemonApi: PokemonAPIProtocol
    
    func fetchTypes(completion: @escaping (Result<[Type], Error>) -> Void) {
        pokemonApi.fetchTypes {
            result in
            switch result {
                case .success(let typeDtos):
                    let types = typeDtos.map { typeDto in Type(name: typeDto.name, image: typeDto.image, englishName: typeDto.englishName)}
                    completion(.success(types))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}

