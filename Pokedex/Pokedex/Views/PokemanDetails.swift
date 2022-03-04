//
//  PokemanDetails.swift
//  Pokedex
//
//  Created by Noah Cordova on 3/1/22.
//

import SwiftUI

struct PokemanDetails: View {
    
    var body: some View {
        VStack {
            HStack{
                Text("Name:")
                Text("Bulbasaur")
            }
            HStack{
                Text("Id:")
                Text("1")
            }
            
        }
    }
}

struct PokemanDetails_Previews: PreviewProvider {
    static var previews: some View {
        PokemanDetails()
    }
}
