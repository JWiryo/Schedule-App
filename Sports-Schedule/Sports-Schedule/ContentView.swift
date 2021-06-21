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
                            Text(schedule.raceName)
                            Spacer()
                            Image(systemName: "star")
                        }
                    }
                    .listStyle(InsetListStyle())
            }
            .navigationTitle("F1 Schedules")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
