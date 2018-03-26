//
//  AppDelegate+Ex.swift
//  PandaTool
//
//  Created by Tayoji on 2018/3/26.
//  Copyright © 2018年 Tayoji. All rights reserved.
//

import UIKit
import CoreTelephony
import UserNotifications

extension AppDelegate:JPUSHRegisterDelegate{
    func reg(launchOptions: [UIApplicationLaunchOptionsKey: Any]?,appKey:String){
        let entity = JPUSHRegisterEntity()
        entity.types = Int(JPAuthorizationOptions.alert.union(JPAuthorizationOptions.badge).union(JPAuthorizationOptions.sound).rawValue)
        JPUSHService.register(forRemoteNotificationConfig: entity, delegate: self)
        JPUSHService.setup(withOption: launchOptions, appKey: appKey, channel: "App Store", apsForProduction: true)
        
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        JPUSHService.registerDeviceToken(deviceToken)
    }
    
    @available(iOS 10.0, *)
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, didReceive response: UNNotificationResponse!, withCompletionHandler completionHandler: (() -> Void)!) {
        let userInfo = response.notification.request.content.userInfo;
        if response.notification.request.trigger?.classForCoder == UNPushNotificationTrigger.classForCoder(){
            
            JPUSHService.handleRemoteNotification(userInfo)
        }
        completionHandler()
        
    }
    
    @available(iOS 10.0, *)
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, willPresent notification: UNNotification!, withCompletionHandler completionHandler: ((Int) -> Void)!) {
        let userInfo = notification.request.content.userInfo;
        if notification.request.trigger?.classForCoder == UNPushNotificationTrigger.classForCoder(){
            
            JPUSHService.handleRemoteNotification(userInfo)
        }
        completionHandler(Int(UNNotificationPresentationOptions.alert.rawValue))
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        JPUSHService.handleRemoteNotification(userInfo)
        
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        JPUSHService.handleRemoteNotification(userInfo)
        completionHandler(UIBackgroundFetchResult.newData)
        
        
    }
    
}
