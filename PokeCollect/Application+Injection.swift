//
//  Application+Injection.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        Resolver.defaultScope = ResolverScopeUnique()
        register {
            PokemonAPI() as PokemonAPIProtocol
        }
        register {
            PokemonRepository() as PokemonRepositoryProtocol
        }
        register {
            GetPopularPokemonUseCase() as GetPopularPokemonUseCaseProtocol
        }
    }
}
