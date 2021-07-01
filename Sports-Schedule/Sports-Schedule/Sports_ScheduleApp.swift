//
//  Sports_ScheduleApp.swift
//  Sports-Schedule
//
//  Created by James Denny Wiryo on 17/6/21.
//

import SwiftUI
import Firebase

@main
struct Sports_ScheduleApp: App {
    
    init() {
        
        // Init Firebase
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
