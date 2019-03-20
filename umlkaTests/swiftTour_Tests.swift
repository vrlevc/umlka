//
//  swiftTour_Tests.swift
//  umlkaTests
//
//  Created by Viktor Levchenko on 3/14/19.
//  Copyright © 2019 LVA. All rights reserved.
//

import XCTest

class swiftTour_Tests: XCTestCase {

    func testSWIFT() {
		
		// constant ----------------------
		let PI = 3.1415
		print("   >>> PI : \(PI)")
		
		// variable ----------------------
		var log = 2323
		print("   >>> log : \(log)")
		log = 12
		print("   >>> log : \(log)")
		
		// types -------------------------
		let implicitInteger = 70
		let implicitDouble  = 70.0
		let explicitDouble: Double = 70
		let explicitFloat: Float = 4
		print("   >>> implicitInteger = 70 : \(implicitInteger)")
		print("   >>> let implicitDouble  = 70.0 : \(implicitDouble)")
		print("   >>> let explicitDouble: Double = 70 : \(explicitDouble)")
		print("   >>> let explicitFloat: Float = 4 : \(explicitFloat)")
		
		// convert -----------------------
        let label = "The width is "
        let width = 94
        let widthLabel = label + String(width)
        print("   >>> label + String(width) : \(widthLabel)")
		
        // """ ---------------------------
        let multiLineText = """
            Line A .....
            Line B .....
        """
        print("   >>> \(multiLineText)")
        
        // [] ----------------------------
        var shoppingList = ["catfish", "water", "tulips"]
        shoppingList[1] = "bottle of water"
        shoppingList.append("blue paint")
        print("   <<< LIST : \(shoppingList)")
        
        var occupations = [
            "Malcolm": "Captain",
            "Kaylee": "Mechanic",
        ]
        occupations["Jayne"] = "Public Relations"
        print("   <<< LIST : \(occupations)")
        
        // empty -------------------------
        let emptyArrray = [String]()
        let emptyDictionalry = [String:Float]()
        XCTAssertTrue(emptyArrray.isEmpty)
        XCTAssertTrue(emptyDictionalry.isEmpty)
        
        shoppingList = [] // make its empty
        occupations = [:] // make its empty
        
		//--------------------------------
    }
	
}
