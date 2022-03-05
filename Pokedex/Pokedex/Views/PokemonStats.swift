//
//  PokemonStats.swift
//  Pokedex
//
//  Created by Ian Blaise on 3/4/22.
//

import SwiftUI

struct PokemonStats: View {
    var pokemonDetails: Pokemon?
    
    var body: some View {
        VStack{
            HStack {
                Text("Stats")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal, 10)
                Spacer()
            }
            HStack{
                HStack {
                    Text("HP: ")
                        .font(.headline)
                    if let unwrapped = pokemonDetails?.stats {
                        Text(String(unwrapped[0].baseStat))
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    Text("Attack: ")
                        .font(.headline)
                    if let unwrapped = pokemonDetails?.stats {
                        Text(String(unwrapped[1].baseStat))
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    Text("Defense: ")
                        .font(.headline)
                    if let unwrapped = pokemonDetails?.stats {
                        Text(String(unwrapped[2].baseStat))
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
            HStack{
                HStack {
                    Text("Speed: ")
                        .font(.headline)
                    if let unwrapped = pokemonDetails?.stats {
                        Text(String(unwrapped[5].baseStat))
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    Text("Special Attack: ")
                        .font(.headline)
                    if let unwrapped = pokemonDetails?.stats {
                        Text(String(unwrapped[4].baseStat))
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    Text("Special Defense: ")
                        .font(.headline)
                    if let unwrapped = pokemonDetails?.stats {
                        Text(String(unwrapped[3].baseStat))
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.primary, lineWidth: 2)
        )
    }
}

struct PokemonStats_Previews: PreviewProvider {
    static var previews: some View {
        PokemonStats()
    }
}
