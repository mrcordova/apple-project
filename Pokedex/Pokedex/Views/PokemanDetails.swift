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
    
    @State private var hasFocus = false

    func getData() {
        let urlString = APIUrl + pokemonName
        let url = URL(string: urlString)
        print("Getting data for \(pokemonName)")
        URLSession.shared.dataTask(with: url!) { data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    do{
                        let decoder = JSONDecoder()
                        
                        let decodedData = try decoder.decode(Pokemon.self, from:data)
                        print("Decoded?")
                        self.data = decodedData
                    } catch {
                        print("Error!: \(error)")
                    }
                }
            }
        }.resume()
    }
    
    var body: some View {
        VStack {
            HStack{
                
                ///The official artwork looks much nicer, but there are more sprites available... 
                //if let unwrapped = data?.sprites.other?.officialArtwork.frontDefault {
                if let unwrapped = data?.sprites.frontDefault {
                    AsyncImage(url: URL(string: unwrapped)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                 .frame(width: 125, height: 125)
                                 .clipShape(Circle())
                                 .overlay {
                                     Circle().stroke(self.hasFocus ? Color.accentColor : .primary, lineWidth: 4)
                                 }
                                 .shadow(radius: 8)
                                 .padding()
                                 .onTapGesture {
                                     self.hasFocus = !self.hasFocus
                                 }
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
            }
            HStack{
                if let unwrapped = data?.name {
                    Text("\(unwrapped.capitalized)")
                        .font(.largeTitle)
                        
                        
                } else {
                    Text("Failed to load!")
                    Text("No data")
                }
            }
            PokemonType(pokemonType: data)
                .padding(.bottom, 10)
            PokemonStats(pokemonDetails: data)
        }
        .onAppear(perform: getData)
        .padding()
        Spacer()
    }
}

struct PokemanDetails_Previews: PreviewProvider {
    static var previews: some View {
        PokemanDetails(pokemonName: "Bulbasaur")
    }
}
