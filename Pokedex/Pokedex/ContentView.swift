//
//  ContentView.swift
//  Pokedex
//
//  Created by Ian Blaise on 3/1/22.
//

import SwiftUI


struct ContentView: View {
    
    @State var data = Pokemon(id: 1, base_experience: 65, height: 25, name: "charmander")
    
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
    }
    
    var body: some View {
        PokeList()
//        VStack {
//            Button(action: {
//                self.getData()
//            }, label: {Text("Test")}).padding()
//
//            Text("\(data.name)")
//            Text("\(data.height)")
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

//func unixTask() {
//    let script = try! NSUserUnixTask(url: URL(fileURLWithPath: "/bin/sh"))
//    let stdout = FileHandle.standardOutput
 //   script.standardOutput = stdout
 //   script.execute(withArguments: ["/Users/noahcordova/Documents/apple-project/pokelist.sh"]){
 //       error in
//        if let error = error {
//            print("Failed", error)
 //       }
 //       exit(0)
 //   }
//}

func downloadPokeData() {
    let task = Process()
    
    let executableUrl = URL(fileURLWithPath: "/bin/sh")
    task.executableURL = executableUrl
    
    let pipe = Pipe()
    task.standardOutput = pipe
    
    task.currentDirectoryURL = URL(fileURLWithPath: "/Users/noahcordova/Documents/apple-project/")
    let args = ["/Users/noahcordova/Documents/apple-project/pokelist.sh"]

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

