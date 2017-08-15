// URLSessionExample1 - simple URLSession.shared

import UIKit
import Foundation
import PlaygroundSupport

// for async code in Playground

PlaygroundPage.current.needsIndefiniteExecution = true

// To remove "Failed to obtain sandbox extension for path=
// Playgrounds are sandboxed

URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)

let session = URLSession.shared
let url = URL(string: "https://www.apple.com")

if let myURL = url {
    
    let task = session.dataTask(with: myURL) { (data, response, error) in
        
        if let error = error {
            print("Error: \(error.localizedDescription)")
        } else {
            if let myResponse = response as? HTTPURLResponse {
                print("Response status code: \(myResponse.statusCode)")
                if let myData = data {
                    if let myString = String(data: myData, encoding: String.Encoding.utf8) {
                        print(myString)
                    }
                }
            }
        }
    }
    task.resume()
}



