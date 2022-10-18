//
//  AppDelegate.swift
//  Pushnotification
//
//  Created by Jomms on 18/10/22.
//

import UIKit
import Firebase
import UserNotificationsUI
import FirebaseMessaging
@main
class AppDelegate: UIResponder, UIApplicationDelegate ,MessagingDelegate,UNUserNotificationCenterDelegate{
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        Messaging.messaging().delegate = self
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options:[.alert,.sound,.badge]){success,_ in
            guard success else {
                return
            }
            print("success")
        }
        return true
    }
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        messaging.token{token,_ in
            guard let token = token else {
                return
            }
            print("token:\(token)")
        }
        
        
    }
    
}
