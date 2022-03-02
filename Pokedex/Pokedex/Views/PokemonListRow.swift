//
//  PokemonListRow.swift
//  Pokedex
//
//  Created by Noah Cordova on 3/1/22.
//

import SwiftUI

struct PokemonListRow: View {
    var pokemonListItem: PokemonListItem
    
    var body: some View {
        
        HStack {
            Text("\(pokemonListItem.name)\n \(pokemonListItem.url)")
        }
        
        
    }
}

struct PokemonListRow_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListRow(pokemonListItem: pokemonList.results[0])
    }
}


