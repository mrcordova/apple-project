//
//  PokeList.swift
//  Pokedex
//
//  Created by Ian Blaise on 3/4/22.
//

import SwiftUI

struct PokeList: View {
    var body: some View {
        NavigationView {
            List (pokemonList.results, id: \.name){ pokemon in
                NavigationLink{
                    PokemanDetails(pokemonName: pokemon.name)
                } label: {
                    PokemonRow(pokemon: pokemon)
                }        .frame(width:200)
            }
            .navigationTitle("Pokemon")
        }
    }
}

struct PokeList_Previews: PreviewProvider {
    static var previews: some View {
        PokeList()
    }
}
