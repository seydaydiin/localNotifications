//
//  ViewController.swift
//  LocalNotification
//
//  Created by Şeyda Aydın on 20.10.2023.
//






import UserNotifications
import UIKit




class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
       
         createNotification()
    }
    
    

    func createNotification() {
        
        
        //Step 1 : Create the notification content
        
        let content = UNMutableNotificationContent()
        content.title = "Hi , I am a notification !"
        content.body = " Look at my message!"
        
        
     
        //Step 2 : Create the notification trigger
        
        let date = Date().addingTimeInterval(5)
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        
        
        
        //Step 3 : Create the request
        
        let uuid = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        
      
        
        //Step 4 : Reqister the request
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
        
        
        
    }

}

