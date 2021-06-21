//
//  F1_API_Caller.swift
//  Sports-Schedule
//
//  Created by James Denny Wiryo on 18/6/21.
//

import Foundation

class F1ScheduleCaller: ObservableObject {
    
    @Published var raceSchedule = [Race]()
    
    init() {
        
        // '!' here means it will never be empty
        let url = URL(string: "https://ergast.com/api/f1/current.json")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error)
            in
        guard let data = data else {
            
            print("Fail to retrieve Data")
            return
            }
            
            // Perform Decoding
            let decoder = JSONDecoder()
            
            do {
                print("Reached here")
                let f1Schedule = try decoder.decode(F1Data.self, from: data)
                DispatchQueue.main.async {
                    for desc in f1Schedule.MRData.RaceTable.Races {
                        self.raceSchedule.append(desc)
                    }
                    print(self.raceSchedule)
                }
            }
            catch {
                print("This is error")
                print(error)
            }
        }
        
        // Fire off the request
        task.resume()
    }
}

