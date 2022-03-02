//
//  ContentView.swift
//  Pokedex
//
//  Created by Ian Blaise on 3/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
            downloadPokeData()
            }, label: {Text("Test Agian")}).padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

func unixTask() {
    let script = try! NSUserUnixTask(url: URL(fileURLWithPath: "/bin/sh"))
    let stdout = FileHandle.standardOutput
    script.standardOutput = stdout
    script.execute(withArguments: ["/Users/noahcordova/Documents/apple-project/pokelist.sh"]){
        error in
        if let error = error {
            print("Failed", error)
        }
        exit(0)
    }
}

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

