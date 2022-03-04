//
//  PokemanDetails.swift
//  Pokedex
//
//  Created by Noah Cordova on 3/1/22.
//

import SwiftUI

struct PokemanDetails: View {
   
    var pokemonName: String
    
    @State var data: Pokemon?
    
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
                if let unwrapped = data?.sprites.frontDefault {
                    
                    AsyncImage(url: URL(string: unwrapped)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                 .frame(width: 125, height: 125)
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            // Since the AsyncImagePhase enum isn't frozen,
                            // we need to add this currently unused fallback
                            // to handle any new cases that might be added
                            // in the future:
                            EmptyView()
                        }
                    }
                }
                
                Spacer()
            }
            HStack{
                Text("Name:")
                if let unwrapped = data?.name {
                    Text("Name: \(unwrapped)")
                } else {
                    Text("No data")
                }
                
                Spacer()
            }
            HStack{
                if let unwrapped = data?.baseExperience {
                    Text("Base exp: \(unwrapped)")
                } else {
                    Text("No data")
                }
                
                Spacer()
            }
        }
        .onAppear(perform: getData)
        
        Spacer()
    }
}

struct PokemanDetails_Previews: PreviewProvider {
    static var previews: some View {
        PokemanDetails(pokemonName: "Bulbasaur")
    }
}
