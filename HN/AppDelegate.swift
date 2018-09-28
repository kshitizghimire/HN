//
//  AppDelegate.swift
//  HN
//
//  Created by Tiz on 28/9/18.
//  Copyright © 2018 Software. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()
        return true
    }
}
