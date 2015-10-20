//
//  AppDelegate.swift
//  Local_NotificationExample
//
//  Created by sudhir Kumar Kumar on 9/21/15.
//  Copyright (c) 2015 Citibank. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Sound |
            UIUserNotificationType.Alert | UIUserNotificationType.Badge, categories: nil))
        
        
        //        UILocalNotification *localNotif =
        //            [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
        //        if (localNotif) {
        //            NSString *itemName = [localNotif.userInfo objectForKey:ToDoItemKey];
        //            [viewController displayItem:itemName];  // custom method
        //            app.applicationIconBadgeNumber = localNotif.applicationIconBadgeNumber-1;
        //        }
        application.applicationState
        
        
        NSLog("application status \(application.applicationState)")
        
        
        switch application.applicationState{
        case  UIApplicationState.Active :
            NSLog("---> Active")
        case UIApplicationState.Inactive :
            NSLog("---> Inactive")
        case UIApplicationState.Background :
            NSLog("---> Background")
        default  :
            NSLog("---> default")
            
        }
        
        
        if let aLaunchOptions = launchOptions {
            
            if let launchOpts:NSDictionary = launchOptions {
                if let notification = (aLaunchOptions as NSDictionary).objectForKey("UIApplicationLaunchOptionsLocalNotificationKey") as? UILocalNotification {
                    
                    var statusStr = self.getApplicationStatus()
                    NSLog("UIApplicationLaunchOptionsLocalNotificationKey %@", statusStr)
                    
                    let alert = UIAlertView()
                    alert.title = ""
                    alert.message = "UIApplicationLaunchOptionsLocalNotificationKey"
                    alert.addButtonWithTitle("OK")
                    alert.show()
                    
                    
                }else{
                    NSLog("2. sudhir Kumar  launchOptions")
                    
                    let alert = UIAlertView()
                    alert.title = ""
                    alert.message = "else OF UIApplicationLaunchOptionsLocalNotificationKey"
                    alert.addButtonWithTitle("OK")
                    alert.show()
                }
            }else{
                
                var statusStr = self.getApplicationStatus()
                NSLog("else %@", statusStr)
                
                let alert = UIAlertView()
                alert.title = ""
                alert.message = "launchOptions not Dictionary"
                alert.addButtonWithTitle("OK")
                alert.show()
                //NSLog("else UIApplicationLaunchOptionsLocalNotificationKey")
            }
        }else{
            
            let alert = UIAlertView()
            alert.title = ""
            alert.message = "launchOptions = nil"
            alert.addButtonWithTitle("OK")
            alert.show()
        }
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification){
        
        var statusStr = self.getApplicationStatus()
        NSLog("didReceiveLocalNotification %@", statusStr)
        
        NSLog("3. sudhir Kumar didReceiveLocalNotification")
        //self.testGimbel("didReceiveLocalNotification")
    }
    
    
    func testGimbel(string : String){
        NSLog("scheduling local notification")
        
        var localNotification: UILocalNotification = UILocalNotification()
        localNotification.alertBody = string
        localNotification.alertAction = "ok"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 0)
        localNotification.userInfo = ["title":".SingleCTA" , "UUID": "0001"] // assign a unique identifier to the
        localNotification.category = "Door Pooper"
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    
    
    func getApplicationStatus() -> String{
        
        switch UIApplication.sharedApplication().applicationState{
        case  UIApplicationState.Active :
           return ("Active")
        case UIApplicationState.Inactive :
            return ("Inactive")
        case UIApplicationState.Background :
            return ("Background")
        default  :
           return ("default")
            
        }
    }
    
    
    func application(application: UIApplication,
        handleActionWithIdentifier identifier: String?,
        forLocalNotification notification: UILocalNotification,
        completionHandler: () -> Void)
    {
        
        
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
        if(identifier == "OK_ACTION"){
            
           
        }
        completionHandler()
    }

    

}

