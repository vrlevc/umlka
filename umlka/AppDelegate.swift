//
//  AppDelegate.swift
//  umlka
//
//  Created by Viktor Levchenko on 3/14/19.
//  Copyright © 2019 LVA. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	
	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
		// TODO: We do not want such behavior for shipped version.
		return true
	}

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Insert code here to initialize your application
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}


}

