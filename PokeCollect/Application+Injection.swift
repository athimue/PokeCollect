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

        // REPOSITORY
        register {
            PokemonRepositoryImpl() as PokemonRepository
        }
        register {
            TypeRepositoryImpl() as TypeRepository
        }

        // USE CASE
        register {
            GetGenerationPokemonsUseCase() as GetGenerationPokemonsUseCaseProtocol
        }
        register {
            GetTypesPokemonsUseCase() as GetTypesUseCaseProtocol
        }
    }
}
