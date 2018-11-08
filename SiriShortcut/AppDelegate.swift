//
//  AppDelegate.swift
//  SiriShortcut
//
//  Created by Ryan Cobelli on 10/30/18.
//  Copyright © 2018 rybel-llc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		return true
	}
	
	// Should never be called...
	func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
		if userActivity.activityType == "RollDiceIntent", let _ = userActivity.interaction?.intent as? RollDiceIntent {
			print("Show UI")
		}
		
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {}

	func applicationDidEnterBackground(_ application: UIApplication) {	}

	func applicationWillEnterForeground(_ application: UIApplication) {	}

	func applicationDidBecomeActive(_ application: UIApplication) {}

	func applicationWillTerminate(_ application: UIApplication) {}


}

