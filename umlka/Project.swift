//
//  Document.swift
//  umlka
//
//  Created by Viktor Levchenko on 3/14/19.
//  Copyright © 2019 LVA. All rights reserved.
//

import Cocoa

open class Project: NSPersistentDocument {

	public override init() {
	    super.init()
		// Add your subclass-specific initialization here.
	}

	// MARK: - Enablers
	
	// This enables auto save.
	open override class var autosavesInPlace: Bool {
		return true
	}

	// MARK: - User Interface
	
	/// - Tag: makeWindowControllersExample
	open override func makeWindowControllers() {
		// Returns the Storyboard that contains your Document window.
		let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
		let windowController =
			storyboard.instantiateController(
				withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
		self.addWindowController(windowController)
		

		// Allowing the user interface elements to bind the document's data model via binding.
		// Hence the user interface elements get their values through the representedObject.
		// Set the view controller's represented object as your document.
		/*
		if let contentVC = windowController.contentViewController as? ViewController {
			contentVC.representedObject = content
			contentViewController = contentVC
		}
		*/
		
	}

}
