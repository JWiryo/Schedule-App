//
//  MainView.swift
//  Sports-Schedule
//
//  Created by James Denny Wiryo on 30/6/21.
//

import SwiftUI

struct MainView: View {
    
    init() {
        
        // Set Tab View Bar color to follow system colour
        UITabBar.appearance().barTintColor = .systemBackground
    }
    
    var body: some View {
        TabView {
            ScheduleView()
                .tabItem {
                    Label("Schedule", systemImage: "calendar")
                }
            LeaderboardView()
                .tabItem {
                    Label("Leaderboard", systemImage: "person.3")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
