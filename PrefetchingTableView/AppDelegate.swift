//
//  AppDelegate.swift
//  PrefetchingTableView
//
//  Created by Jadië Oliveira on 02/05/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


	var window: UIWindow?
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = UINavigationController(rootViewController: ViewController())
		window?.makeKeyAndVisible()
		return true
	}

}

