//
//  ContentView.swift
//  Sports-Schedule
//
//  Created by James Denny Wiryo on 17/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var f1ScheduleCaller = F1ScheduleCaller()
    
        var body: some View {
            NavigationView {
                VStack {
                    List(f1ScheduleCaller.raceSchedule) { schedule in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(schedule.raceName)
                                    .font(.title)
                                VStack(alignment: .leading) {
                                    Text(schedule.date)
                                        .font(.subheadline)
                                        .foregroundColor(Color.gray)
                                    Text(schedule.time)
                                        .font(.subheadline)
                                        .foregroundColor(Color.gray)
                                }
                            }
                            Spacer()
                            Image(systemName: "star")
                        }
                    }
                    .listStyle(InsetListStyle())
            }
            .navigationTitle("Upcoming F1 Races")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
