//
//  ExtensionNotificationDelegate.swift
//  Study App WatchKit Extension
//
//  Created by IK on 10/18/20.
//
import os
import WatchKit
import Foundation
import UserNotifications


class NotificationProcessor: NSObject {
    override init(){
        super.init()
    }
    /**
     Registers for known notification categories.
     */
    func registerNotifications() {
        
        let action = UNNotificationAction(
            identifier: "test_action",
            title: "Action",
            options: [.foreground])
        
        let category = UNNotificationCategory(
            identifier: "test_category",
            actions: [action],
            intentIdentifiers: [],
            options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
    }
}

// MARK: - UNUserNotificationCenterDelegate
extension NotificationProcessor: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.notification == nil {
            print("[\(#function)] Notification is null")
        } else {
            print("[\(#function)] Notification body: \(response.notification.request.content.body)")
        }
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("[\(#function)] Notification body: \(notification.request.content.body)")
        completionHandler(.banner)
    }
}
