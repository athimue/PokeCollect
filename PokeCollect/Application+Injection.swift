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
        
        // API & DAO
        register {
            PokemonAPI() as PokemonAPIProtocol
        }
        register {
            DatabaseManager()
        }
        register {
            CollectionDao()
        }
        register {
            TeamDao()
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
