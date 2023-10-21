//
//  AppDelegate.swift
//  LocalNotification
//
//  Created by Şeyda Aydın on 20.10.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        //bildirimlerin yönetildiği bir bildirim merkezi oluşturur
        let center = UNUserNotificationCenter.current()
        
        //delegenin kullanılacağını belirtilir.Bildirimlerin nasıl işleneceği ve yönlendirileceği belirlenir.
           center.delegate = self
        
      
       //kullanıcıdan bildirimlere erişim izni almak için bir istekte bulunur.Bildirim erişim izninin nasıl görüntüleneceği belirlenir.
        center.requestAuthorization(options: [.alert,.badge,.sound], completionHandler: {(accepted,error) in
            
            //eğer kullanıcı bildirim erişimini reddederse veya izin vermezse bir hata mesajı görüntüler.
            if !accepted {
                print("Notification access denied")
            }
            
        })
        return true
    }
    

    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {

        //completionHandler parametresi aracılığıyla bu fonksiyon, bildirimin nasıl görüntüleneceğini belirleyen bir dizi seçeneği alır.
        completionHandler( [.list, .banner, .badge, .sound])
    }
    
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    
    
    
    
 
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

