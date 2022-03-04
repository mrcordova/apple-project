//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ian Blaise on 3/3/22.
//

import Foundation

struct Pokemon: Codable, Hashable, Identifiable {
    var id: Int
    var base_experience: Int
    var height: Int
    var name: String
}
