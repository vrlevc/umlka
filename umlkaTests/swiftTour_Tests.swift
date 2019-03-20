//
//  swiftTour_Tests.swift
//  umlkaTests
//
//  Created by Viktor Levchenko on 3/14/19.
//  Copyright © 2019 LVA. All rights reserved.
//

import XCTest

class swiftTour_Tests: XCTestCase {

    func testSWIFT_SimpleValues() {
		
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
	
    func testSWIFT_ControlFlow() {
        
        // if ----------------------------
        let individualScores = [75, 43, 103, 87, 12]
        var teamScore = 0
        if individualScores.count > 1 && teamScore == 0 {
            print("   >>> Team is not empty but new")
        }
        
        // for ---------------------------
        for score in individualScores {
            if score > 50 {
                teamScore += 3
            } else {
                teamScore += 1
            }
        }
        print("   >>> Team score : \(teamScore)")
        
        // ? -----------------------------
        let optionalString: String? = "Hello"
        print("   >>> optionalSting is nil : \(optionalString == nil)")
        
        let optionalName: String? = "John Appleseed" // nil
        var greeting = "Hello!"
        if let name = optionalName {
            greeting = "Hello \(name)"
        } else {
            greeting = "Hello stranger"
        }
        print("   <<< \(greeting)")
        
        // ?? ----------------------------
        let nickName: String? = nil
        let fullName: String = "John Appleseed"
        let informalGreeting = "Hi \(nickName ?? fullName)"
        print("   >>> Use default for optional value : \(informalGreeting)")
        
        // switch ------------------------
        let vegetable = "red pepper"
        switch vegetable {
        case "celery":
            print("Add some raisins and make ants on a log.")
        case "cucumber", "watercress":
            print("That would make a good tea sandwich.")
        case let x where x.hasSuffix("pepper"):
            print("Is it a spicy \(x)?")
        default:
            print("Everything tastes good in soup.")
        }
        
        // for-in ------------------------
        let interestingNumbers = [
            "Prime": [2, 3, 5, 7, 11, 13],
            "Fibonacci": [1, 1, 2, 3, 5, 8],
            "Square": [1, 4, 9, 16, 25],
            ]
        var largest = 0
        var largestKind:String? = nil
        for (kind, numbers) in interestingNumbers {
            for number in numbers {
                if number > largest {
                    largest = number
                    largestKind = kind
                }
            }
        }
        print("   >>> Largest number of \(largestKind ?? "xxx") type is : \(largest)")
        
        // while -------------------------
        var n = 2
        while n < 100 {
            n *= 2
        }
        print("   >>> while ... \(n)")
        
        // repeat-while ------------------
        var m = 2
        repeat {
            m *= 2
        } while m < 100
        print("   >>> repeat-while ... \(n)")
        
        // ..< ---------------------------
        var total = 0
        for i in 0..<4 {
            total += i
        }
        print("   >>> ommit upper bound : \(total)")
        
        // ... ---------------------------
        var totalEx = 0
        for i in 0...4 {
            totalEx += i
        }
        print("   >>> full range : \(totalEx)")
        
        //--------------------------------
    }
}
