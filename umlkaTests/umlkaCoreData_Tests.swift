//
//  umlkaCoreData_Tests.swift
//  umlkaTests
//
//  Created by Viktor Levchenko on 3/15/19.
//  Copyright © 2019 LVA. All rights reserved.
//

import XCTest

class umlkaCoreData_Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitializePersistentContainer() {

		let persistaentContatiner = NSPersistentContainer(name: "Document")
		XCTAssertNotNil(persistaentContatiner)
		
		persistaentContatiner.loadPersistentStores { description, error in
			if let error = error {
				fatalError("Unable to load persistent stores: \(error)")
			}
		}
		XCTAssertNotNil(persistaentContatiner.managedObjectModel)
		XCTAssertNotNil(persistaentContatiner.viewContext)
		XCTAssertNotNil(persistaentContatiner.persistentStoreCoordinator)
    }

}
