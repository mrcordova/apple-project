//
//  PokemonRow.swift
//  Pokedex
//
//  Created by Ian Blaise on 3/4/22.
//

import SwiftUI

struct PokemonRow: View {
    var pokemon: PokemonListItem
    
    var body: some View {
        HStack {
            Image("placeholder")
                .resizable()
                .frame(width:50, height:50)
            Text(pokemon.name.capitalized)
            Spacer()
        }
        .border(.primary)
        .frame(width: 200)
    }
}

struct PokemonRow_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRow(pokemon: pokemonList.results[2])
    }
}
