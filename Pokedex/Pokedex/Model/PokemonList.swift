//
//  PokemonList.swift
//  Pokedex
//
//  Created by Noah Cordova on 3/1/22.
//
import Foundation
import SwiftUI


struct PokemonList: Codable, Identifiable {
    var id: Int
    let count: Int
    let next: String
    let prevoius: String
    let results: [PokemonListItem]
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case count = "Count"
        case next = "Next"
        case prevoius = "Previous"
        case results = "Results"
    }
}

struct PokemonListItem: Codable {
    let name: String
    let url: String
}

