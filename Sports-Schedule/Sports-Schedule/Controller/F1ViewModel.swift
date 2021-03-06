//
//  F1_API_Caller.swift
//  Sports-Schedule
//
//  Created by James Denny Wiryo on 18/6/21.
//

import Foundation

class F1ViewModel: ObservableObject {
    
    @Published var raceSchedule = [Race]()
    @Published var pastRaceSchedule = [Race]()
    
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
                let f1Schedule = try decoder.decode(F1Data.self, from: data)
                DispatchQueue.main.async {
                    for var desc in f1Schedule.MRData.RaceTable.Races {
                        
                        // Combine Date and Time
                        let isoCurrentScheduleDateTime = desc.date + "T" + desc.time
                        
                        // Initialise Formatter
                        let dateFormatter = ISO8601DateFormatter()
                        dateFormatter.timeZone = TimeZone.current
                        
                        // Convert to DateTime Type
                        let dateTime = dateFormatter.date(from:isoCurrentScheduleDateTime)!
                        
                        // Append Race Data into List if has not happened
                        let currentDate = Date()
                        if(currentDate < dateTime) {
                            
                            self.updateDateTimeLocalTime(dateFormatter, dateTime, &desc)
                            
                            // Append to Upcoming Schedule List
                            self.raceSchedule.append(desc)
                        }
                        else {
                            
                            self.updateDateTimeLocalTime(dateFormatter, dateTime, &desc)
                            
                            // Append to Upcoming Schedule List
                            self.pastRaceSchedule.append(desc)
                        }
                    }
                    print(self.raceSchedule)
                }
            }
            catch {
                print(error)
            }
        }
        
        // Fire off the request
        task.resume()
    }
    
    func toggleNotifSign(index: Int) -> Void {
        raceSchedule[index].isNotifClicked.toggle()
    }
    
    fileprivate func updateDateTimeLocalTime(_ dateFormatter: ISO8601DateFormatter, _ dateTime: Date, _ desc: inout Race) {
        // Update Date and Time in Schedule
        let dateTimeString = dateFormatter.string(from: dateTime)
        desc.date = dateTimeString.components(separatedBy: "T")[0]
        desc.time = dateTimeString.components(separatedBy: "T")[1].components(separatedBy: "+")[0]
    }
}

