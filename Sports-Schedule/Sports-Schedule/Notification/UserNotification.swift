//
//  UserNotification.swift
//  Sports-Schedule
//
//  Created by James Denny Wiryo on 24/6/21.
//

import Foundation
import UserNotifications

struct UserNotification {
    
    // Use Provisional notification option if needed
//    let notifOptions = [.alert, .badge, .sound, .provisional]
    
    func requestNotifPermission() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .badge, .sound])
        { success, error in
            if success {
                print("Permission Granted!")
            }
            else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
