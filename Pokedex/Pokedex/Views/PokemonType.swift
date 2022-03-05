//
//  PokemonType.swift
//  Pokedex
//
//  Created by Ian Blaise on 3/4/22.
//

import SwiftUI

struct PokemonType: View {
    var pokemonType: Pokemon?
    var body: some View {
        HStack {
            if let types = pokemonType?.types {
                ForEach(types, id: \.self) { type in
                    switch type.type.name {
                    case "normal":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                    case "poison":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.orange, lineWidth: 2)
                            )
                    case "fire":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.red, lineWidth: 2)
                            )
                    case "water":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    case "grass":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.green, lineWidth: 2)
                            )
                    case "flying":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.teal, lineWidth: 2)
                            )
                    case "bug":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.brown, lineWidth: 2)
                            )
                    case "electric":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.yellow, lineWidth: 2)
                            )
                    case "ice":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.cyan, lineWidth: 2)
                            )
                    case "fighting":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                    case "ground":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.brown, lineWidth: 2)
                            )
                    case "psychic":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.indigo, lineWidth: 2)
                            )
                    case "rock":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.brown, lineWidth: 2)
                            )
                    case "ghost":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    case "dark":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    case "dragon":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.mint, lineWidth: 2)
                            )
                    case "steel":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                    case "fairy":
                        Text(type.type.name.capitalized)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.pink, lineWidth: 2)
                            )
                    default:
                        Text("no data")
                    }
                    //Text(type.type.name)
                }
            } else {
                Text("Blah")
            }
        }
    }
}

struct PokemonType_Previews: PreviewProvider {
    static var previews: some View {
        PokemonType()
    }
}
