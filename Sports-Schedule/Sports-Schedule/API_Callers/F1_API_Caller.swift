//
//  F1_API_Caller.swift
//  Sports-Schedule
//
//  Created by James Denny Wiryo on 18/6/21.
//

import Foundation

class F1ScheduleCaller {
    
    func getCurrentSeason() {
        
        // '!' here means it will never be empty
        let url = URL(string: "http://ergast.com/api/f1/current.json")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error)
            in
        guard let data = data else {
            
            print("Fail to retrieve Data")
            return
            }
            
//            print("The response is : ",String(data: data, encoding: .utf8)!)
            
            // Perform Decoding
            let decoder = JSONDecoder()
            
            do {
                let f1Schedule = try decoder.decode(F1Data.self, from: data)
                print(f1Schedule)
            }
            catch {
                print(error)
            }
        }
            
        //print(NSString(data: data, encoding: String.Encoding.utf8.rawValue) as Any)
        task.resume()
    }
}

