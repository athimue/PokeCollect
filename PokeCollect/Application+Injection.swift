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
            DatabaseManager.shared as DatabaseManager
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
        register {
            CollectionRepositoryImpl() as CollectionRepository
        }
        register {
            TeamRepositoryImpl() as TeamRepository
        }
        register {
            SearchRepositoryImpl() as SearchRepository
        }

        // USE CASE
        register {
            GetGenerationPokemonsUseCase() as GetGenerationPokemonsUseCaseProtocol
        }
        register {
            GetTypesPokemonsUseCase() as GetTypesUseCaseProtocol
        }
        register {
            GetCollectionUseCase() as GetCollectionUseCaseProtocol
        }
        register {
            GetTeamUseCase() as GetTeamUseCaseProtocol
        }
        register {
            GetSearchUseCase() as GetSearchUseCaseProtocol
        }
        register {
            AddPokemonToTeamUseCase() as AddPokemonToTeamUseCaseProtocol
        }
        register {
            AddPokemonToCollectionUseCase() as AddPokemonToCollectionUseCaseProtocol
        }
    }
}
