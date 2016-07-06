//
//  AppDelegate.swift
//  angela
//
//  Created by Maria Carolina Santos on 25/06/16.
//  Copyright © 2016 Maria Carolina Marinho Séves Santos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let defaults = NSUserDefaults.standardUserDefaults()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let logged = defaults.stringForKey("loggedIn")
        let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        let passwordViewController = PasswordViewController(nibName: "PasswordViewController", bundle: nil)
        
        if(logged == "1"){
            window?.rootViewController = passwordViewController
        }
        else
        {
            window?.rootViewController = loginViewController
        }
        
        window?.makeKeyAndVisible()
        
        //Habilitando notificações
        let notificationTypes: UIUserNotificationType = [UIUserNotificationType.Alert, UIUserNotificationType.Badge, UIUserNotificationType.Sound]
        let pushNotificationSettings = UIUserNotificationSettings(forTypes: notificationTypes, categories: nil)
        application.registerUserNotificationSettings(pushNotificationSettings)
        application.registerForRemoteNotifications()
        
        
        let textAction = UIMutableUserNotificationAction()
        textAction.identifier = "TEXT_ACTION"
        textAction.title = "Reply"
        textAction.activationMode = .Background
        textAction.authenticationRequired = false
        textAction.destructive = false
        textAction.behavior = .TextInput
        
        enum UIUserNotificationActionBehavior : UInt {
            case Default // the default action behavior
            case TextInput // system provided action behavior, allows text input from the user
        }
        
        let category = UIMutableUserNotificationCategory()
        category.identifier = "CATEGORY_ID"
        category.setActions([textAction], forContext: .Default)
        category.setActions([textAction], forContext: .Minimal)
        
        let categories = NSSet(object: category) as! Set<UIUserNotificationCategory>
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: categories)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        application.beginBackgroundTaskWithName("showNotification", expirationHandler: nil)
        
        return true
        
    }
    
    //Função para se certificar que o device pode receber push
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        print("DEVICE TOKEN = \(deviceToken)")
    }
    
    //Função para mostrar que o device não pode ser registrado
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print(error)
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        let logged = defaults.stringForKey("loggedIn")
        let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        let passwordViewController = PasswordViewController(nibName: "PasswordViewController", bundle: nil)
        
        if(logged == "1"){
            window?.rootViewController = passwordViewController
        }
        else
        {
            window?.rootViewController = loginViewController
        }
        
        window?.makeKeyAndVisible()
        
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        
        let logged = defaults.stringForKey("loggedIn")
        let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        let passwordViewController = PasswordViewController(nibName: "PasswordViewController", bundle: nil)
        
        if(logged == "1"){
            window?.rootViewController = passwordViewController
        }
        else
        {
            window?.rootViewController = loginViewController
        }
        
        window?.makeKeyAndVisible()
        
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
    }
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, withResponseInfo responseInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        var pass : NSString
        let reply = responseInfo[UIUserNotificationActionResponseTypedTextKey]
        pass = reply as! NSString
        //        defaults.setInteger(2, forKey: "deuRuim")
        
        if (pass != defaults.stringForKey("senha")){
            print("fudeu")
            defaults.setInteger(1, forKey: "deuRuim")
            
        }
        else{
            defaults.setInteger(2, forKey: "deuRuim")
        }
    }
    
    
    
}

