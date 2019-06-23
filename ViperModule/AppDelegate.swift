//
//  AppDelegate.swift
//  ViperModule
//
//  Created by Dmitrii Space on 2019-06-15.
//  Copyright © 2019 Dmitrii Space. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let context = ListModuleContext(moduleOutput: nil)
        let container = ListModuleContainer.assemble(with: context)
        let window = UIWindow(frame: UIScreen.main.bounds)

        self.window = window
        window.rootViewController = container.viewController
        window.makeKeyAndVisible()
        return true
    }
}
