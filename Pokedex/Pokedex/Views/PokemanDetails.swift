//
//  PokemanDetails.swift
//  Pokedex
//
//  Created by Noah Cordova on 3/1/22.
//

import SwiftUI

struct PokemanDetails: View {
   
    var pokemonName: String
    
    @State var data = Pokemon(id: 1, base_experience: 65, height: 25, name: "charmander")
    
    func getData() {
        let urlString = APIUrl + pokemonName
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    do{
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(Pokemon.self, from:data)
                        self.data = decodedData
                    } catch {
                        print(error)
                    }
                }
            }
        }.resume()
    }
    
    var body: some View {
        VStack {
            HStack{
                Text("Name:")
                Text(data.name)
            }
            HStack{
                Text("Id:")
                Text(String(data.id))
            }
            
        }
        .onAppear(perform: getData)
    }
}

struct PokemanDetails_Previews: PreviewProvider {
    static var previews: some View {
        PokemanDetails(pokemonName: "Bulbasaur")
    }
}
