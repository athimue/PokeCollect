//
//  TeamViewModel.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Foundation
import Resolver

struct TeamViewModel: ObservableObject {
    @Injected private var getGenerationPokemonsUseCase: GetGenerationPokemonsUseCaseProtocol
    @Injected private var getTypesUseCase: GetTypesUseCaseProtocol
}
