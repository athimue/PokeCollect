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
            PokemonRepository() as PokemonRepositoryProtocol
        }
        register {
            TypeRepository() as TypeRepositoryProtocol
        }
        
        //USE CASE
        register {
            GetGenerationPokemonsUseCase() as GetGenerationPokemonsUseCaseProtocol
        }
        register {
            GetTypesPokemonsUseCase() as GetTypesUseCaseProtocol
        }
    }
}
