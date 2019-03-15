//
//  ViewController.swift
//  umlka
//
//  Created by Viktor Levchenko on 3/14/19.
//  Copyright © 2019 LVA. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}

	override var representedObject: Any? {
		didSet {
			// Update the view, if already loaded.
			
			// From example:
			// When you organize the user interface into groups of view controllers called child view controllers,
			// NSViewController passes down its representedObject to all of its children.
			// E.g.
			// Pass down the represented object to all of the child view controllers.
			/*
			for child in children {
				child.representedObject = representedObject
			}
			*/
		}
	}


}

