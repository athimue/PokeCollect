//
//  PokemonTranslator.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 08/11/2023.
//

import Foundation

class PokemonTranslator {
    static func translateType(_ type: String) -> String {
        print(type)
        switch type {
            case "Normal":
                return "f/fb/Normal"
            case "Combat":
                return "3/30/Fighting"
            case "Vol":
                return "7/7f/Flying"
            case "Poison":
                return "0/05/Poison"
            case "Sol":
                return "8/8f/Ground"
            case "Roche":
                return "0/0b/Rock"
            case "Insecte":
                return "7/7d/Bug"
            case "Spectre":
                return "a/ab/Ghost"
            case "Acier":
                return "c/c9/Steel"
            case "Feu":
                return "3/30/Fire"
            case "Eau":
                return "9/9d/Water"
            case "Plante":
                return "c/c5/Grass"
            case "Électrik":
                return "2/2f/Electric"
            case "Psy":
                return "2/21/Psychic"
            case "Glace":
                return "7/77/Ice"
            case "Dragon":
                return "c/c7/Dragon"
            case "Ténèbres":
                return "0/0e/Dark"
            case "Fée":
                return "4/43/Fairy"
            default:
                return type
        }
    }
}
