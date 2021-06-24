//
//  ContentView.swift
//  Sports-Schedule
//
//  Created by James Denny Wiryo on 17/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var f1ScheduleCaller = F1ScheduleCaller()
    
    init() {
        // Request User Notification Permission on App Launch
        let userNotificationInst = UserNotification()
        userNotificationInst.requestNotifPermission()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(f1ScheduleCaller.raceSchedule) { schedule in
                    HStack {
                        Image(schedule.Circuit.Location.country)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                            .frame(width: 50, height: 50, alignment: .center)
                        VStack(alignment: .leading) {
                            Text(schedule.raceName)
                                .font(.callout)
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
