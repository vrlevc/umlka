//
//  umlkaCoreData_Tests.swift
//  umlkaTests
//
//  Created by Viktor Levchenko on 3/15/19.
//  Copyright © 2019 LVA. All rights reserved.
//

import XCTest
import umlka

class umlkaCoreData_Tests: XCTestCase {

	var persistaentContatiner: NSPersistentContainer?
	
    override func setUp() {

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCodeDataStackProject() {
		
		persistaentContatiner = NSPersistentContainer(name: "Project")
		XCTAssertNotNil(persistaentContatiner)
		
		persistaentContatiner?.loadPersistentStores { description, error in
			if let error = error {
				XCTAssertNil(error)
				fatalError("Unable to load persistent stores: \(error)")
			}
		}
		
		XCTAssertNotNil(persistaentContatiner?.managedObjectModel)
		XCTAssertNotNil(persistaentContatiner?.viewContext)
		XCTAssertNotNil(persistaentContatiner?.persistentStoreCoordinator)
		
		let classObj: Class = NSEntityDescription.insertNewObject(forEntityName: "Class", into: persistaentContatiner!.viewContext) as! Class
		XCTAssertNotNil(classObj)
		
    }
	
	func testProject() {
		
		let project: Project = try! Project(type: NSSQLiteStoreType)
		XCTAssertNotNil(project, "Create new project, storage type SQLite")
		
		let classObj: Class = NSEntityDescription.insertNewObject(forEntityName: "Class", into: project.managedObjectContext!) as! Class
		XCTAssertNotNil(classObj, "Create Class object in project")
		
		classObj.name  = "QObject"
		XCTAssertNotNil(classObj.name, "We set it to be QObject")
		
	}

}
