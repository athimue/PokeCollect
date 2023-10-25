//
//  PokemonDto.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 18/10/2023.
//

import Foundation

struct PokemonDto: Codable {
    let id: Int
    let pokedexId: Int?
    let name: String
    let image: String
    let sprite: String
    let slug: String
    let stats: StatsDto
    let apiTypes: [ApiTypeDto]
    let apiGeneration: Int
    let apiResistances: [ApiResistanceDto]
    let resistanceModifyingAbilitiesForApi: ResistanceModifyingAbilitiesForAPIUnion
    let apiEvolutions: [APIEvolutionDto]
    let apiPreEvolution: APIPreEvolutionUnion
    let apiResistancesWithAbilities: [ApiResistanceDto]

    enum CodingKeys: String, CodingKey {
        case id
        case pokedexId
        case name
        case image
        case sprite
        case slug
        case stats
        case apiTypes
        case apiGeneration
        case apiResistances
        case resistanceModifyingAbilitiesForApi
        case apiEvolutions
        case apiPreEvolution
        case apiResistancesWithAbilities
    }

    init(id: Int, pokedexId: Int?, name: String, image: String, sprite: String, slug: String, stats: StatsDto, apiTypes: [ApiTypeDto], apiGeneration: Int, apiResistances: [ApiResistanceDto], resistanceModifyingAbilitiesForApi: ResistanceModifyingAbilitiesForAPIUnion, apiEvolutions: [APIEvolutionDto], apiPreEvolution: APIPreEvolutionUnion, apiResistancesWithAbilities: [ApiResistanceDto]) {
        self.id = id
        self.pokedexId = pokedexId
        self.name = name
        self.image = image
        self.sprite = sprite
        self.slug = slug
        self.stats = stats
        self.apiTypes = apiTypes
        self.apiGeneration = apiGeneration
        self.apiResistances = apiResistances
        self.resistanceModifyingAbilitiesForApi = resistanceModifyingAbilitiesForApi
        self.apiEvolutions = apiEvolutions
        self.apiPreEvolution = apiPreEvolution
        self.apiResistancesWithAbilities = apiResistancesWithAbilities
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        pokedexId = try values.decode(Int.self, forKey: .pokedexId)
        name = try values.decode(String.self, forKey: .name)
        image = try values.decode(String.self, forKey: .image)
        sprite = try values.decode(String.self, forKey: .sprite)
        slug = try values.decode(String.self, forKey: .slug)
        stats = try values.decode(StatsDto.self, forKey: .stats)
        apiTypes = try values.decode([ApiTypeDto].self, forKey: .apiTypes)
        apiGeneration = try values.decode(Int.self, forKey: .apiGeneration)
        apiResistances = try values.decode([ApiResistanceDto].self, forKey: .apiResistances)
        resistanceModifyingAbilitiesForApi = try values.decode(ResistanceModifyingAbilitiesForAPIUnion.self, forKey: .resistanceModifyingAbilitiesForApi)
        apiEvolutions = try values.decode([APIEvolutionDto].self, forKey: .apiEvolutions)
        apiPreEvolution = try values.decode(APIPreEvolutionUnion.self, forKey: .apiPreEvolution)
        apiResistancesWithAbilities = try values.decode([ApiResistanceDto].self, forKey: .apiResistancesWithAbilities)
    }
}
