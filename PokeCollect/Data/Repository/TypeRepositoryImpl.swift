//
//  TypeRepository.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 19/10/2023.
//
import Combine
import Foundation
import Resolver

struct TypeRepositoryImpl: TypeRepository {
    @Injected private var pokemonApi: PokemonAPIProtocol

    func fetchTypes() -> AnyPublisher<[Type], Error> {
        pokemonApi.fetchTypes().map { typeDtoArray in typeDtoArray.map { typeDto in Type(name: typeDto.name, image: typeDto.image, englishName: typeDto.englishName) }
        }.eraseToAnyPublisher()
    }
}
