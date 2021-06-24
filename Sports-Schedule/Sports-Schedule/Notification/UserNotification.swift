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
    
    func getUserNotificationStatus() {
        UNUserNotificationCenter.current()
            .getNotificationSettings(completionHandler: {
                settings in
                print(settings)
            }
        )
    }
    
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
    
    func sendRaceScheduleNotification() {
        let notifContent = UNMutableNotificationContent()
        notifContent.title = "Race Schedule"
        notifContent.subtitle = "Test Subtitle"
        notifContent.sound = UNNotificationSound.default

        // Show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        // Choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: notifContent, trigger: trigger)

        // Add our notification request
        UNUserNotificationCenter.current().add(request)
    }
}
