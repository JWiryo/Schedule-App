//
//  ContentView.swift
//  Sports-Schedule
//
//  Created by James Denny Wiryo on 17/6/21.
//

import SwiftUI

struct ContentView: View {
    
    // Instantiate Variables, Classes and Structs
    @State var isClicked = false
    @ObservedObject var f1ScheduleCaller = F1ViewModel()
    let userNotificationInst = UserNotification()
    
    // On App Launch
    init() {
        
        // Request User Notification Permission on App Launch
        userNotificationInst.requestNotifPermission()
    }
    
    // Generate View
    var body: some View {
        NavigationView {
            VStack {
                let raceSchedules = f1ScheduleCaller.raceSchedule
                List(raceSchedules.indices, id: \.self) { idx in
                    HStack {
                        Image(raceSchedules[idx].Circuit.Location.country)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                            .frame(width: 50, height: 50, alignment: .center)
                        VStack(alignment: .leading) {
                            Text(raceSchedules[idx].raceName)
                                .font(.callout)
                            VStack(alignment: .leading) {
                                Text(raceSchedules[idx].date)
                                    .font(.subheadline)
                                    .foregroundColor(Color.gray)
                                Text(raceSchedules[idx].time)
                                    .font(.subheadline)
                                    .foregroundColor(Color.gray)
                            }
                        }
                        Spacer()
                        Button(action: {
                            
                            // Schedule local notification when button is pressed
                            f1ScheduleCaller.toggleNotifSign(index: idx)
                            userNotificationInst.sendRaceScheduleNotification()
                        }) {
                            
                            // Change image when button is pressed
                            Image(systemName: raceSchedules[idx].isNotifClicked == true ? "bell.fill" : "bell")
                        }
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
