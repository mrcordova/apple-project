//
//  PokeList.swift
//  Pokedex
//
//  Created by Ian Blaise on 3/4/22.
//

import SwiftUI

struct PokeList: View {
    var body: some View {
        List (pokemonList.results, id: \.name){ pokemon in
            PokemonRow(pokemon: pokemon)
        }
    }
}

struct PokeList_Previews: PreviewProvider {
    static var previews: some View {
        PokeList()
    }
}
