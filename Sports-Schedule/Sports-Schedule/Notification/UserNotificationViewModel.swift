//
//  UserNotification.swift
//  Sports-Schedule
//
//  Created by James Denny Wiryo on 24/6/21.
//

import Foundation
import UserNotifications

struct UserNotificationViewModel {
    
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
    
    func sendRaceScheduleNotification(raceDate: String, raceTime: String, raceName: String) {
        let notifContent = UNMutableNotificationContent()
        notifContent.title = raceName + " is starting!"
        notifContent.subtitle = "It's lights out and away we go!"
        notifContent.sound = UNNotificationSound.default

        // [Testing] Show this notification five seconds from now
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // Convert String to Time
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        // Convert Date to DateComponent
        let dateForNotif = dateFormatter.date(from: raceDate + "T" + raceTime)
        let dateForNotifComps = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: dateForNotif!)
        
        // Show notification on race time
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateForNotifComps, repeats: false)

        // Choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: notifContent, trigger: trigger)

        // Add our notification request
        UNUserNotificationCenter.current().add(request)
    }
}
