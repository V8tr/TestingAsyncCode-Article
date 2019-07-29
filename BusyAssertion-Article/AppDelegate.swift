//
//  AppDelegate.swift
//  BusyAssertion-Article
//
//  Created by Vadym Bulavin on 7/29/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let service = MusicService()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        service.search("rock") { _ in }
        return true
    }

}

