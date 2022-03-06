//
//  ContentView.swift
//  Pokedex
//
//  Created by Ian Blaise on 3/1/22.
//

import SwiftUI


struct ContentView: View {
    
    @State var data: Pokemon?
    
    func getData() {
        let urlString = APIUrl + "bulbasaur"
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
    } // do we still need this? - noah
    
    var body: some View {
        Intro()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}


func downloadPokeData() {
    let task = Process()
    
    let executableUrl = URL(fileURLWithPath: "/bin/sh")
    task.executableURL = executableUrl
    
    let pipe = Pipe()
    task.standardOutput = pipe
    
    task.currentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let args = ["pokelist.sh"]

    task.arguments = args
    
    task.terminationHandler = {
        _ in
        print("process run complete")
    }
    try! task.run()
    task.waitUntilExit()
    
    
    let d = pipe.fileHandleForReading.readDataToEndOfFile()
    let ds = String(data:d, encoding: String.Encoding.utf8)
    print("terminal out: \(ds!)")
    print("execution complete")

}

