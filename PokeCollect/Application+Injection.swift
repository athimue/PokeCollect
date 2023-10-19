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
            GetFirstGenerationPokemonsUseCase() as GetFirstGenerationPokemonsUseCaseProtocol
        }
        register {
            GetSecondGenerationPokemonsUseCase() as GetSecondGenerationPokemonsUseCaseProtocol
        }
        register {
            GetThirdGenerationPokemonsUseCase() as GetThirdGenerationPokemonsUseCaseProtocol
        }
        register {
            GetFourthGenerationPokemonsUseCase() as GetFourthGenerationPokemonsUseCaseProtocol
        }
        register {
            GetFifthGenerationPokemonsUseCase() as GetFifthGenerationPokemonsUseCaseProtocol
        }
        register {
            GetSixthGenerationPokemonsUseCase() as GetSixthGenerationPokemonsUseCaseProtocol
        }
        register {
            GetSeventhGenerationPokemonsUseCase() as GetSeventhGenerationPokemonsUseCaseProtocol
        }
        register {
            GetEighthGenerationPokemonsUseCase() as GetEighthGenerationPokemonsUseCaseProtocol
        }
        register {
            GetTypesPokemonsUseCase() as GetTypesUseCaseProtocol
        }
    }
}
