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
	
	func testSWIFT_Function() {
		
		// func --------------------------
		func greet(person: String, day: String) -> String {
			return "Hello \(person), today is \(day)."
		}
		print("   >>> greet : \(greet(person: "Bob", day: "Tuesday"))")
		
		func greets(_ person: String, on day: String) -> String {
			return "Hello \(person), today is \(day)."
		}
		print("   >>> greets : \(greets("John", on: "Wednesday"))")
		
		// tuple -------------------------
		func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
			var min = scores[0]
			var max = scores[0]
			var sum = 0
			
			for score in scores {
				if score > max {
					max = score
				} else if score < min {
					min = score
				}
				sum += score
			}
			
			return (min, max, sum)	// tuple
		}
		let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
		print("   >>> statistics.sum : \(statistics.sum)")  // by name
		print("   >>> statistics.2 : \(statistics.2)")		// by number
		
		// nested ------------------------
		func returnFifteen() -> Int {
			var y = 10
			func add() {	// nested
				y += 5
			}
			add()
			return y
		}
		XCTAssertEqual(15, returnFifteen())
		
		// return func -------------------
		func makeIncrementer() -> ((Int) -> Int) {
			func addOne(number: Int) -> Int {
				return 1 + number
			}
			return addOne
		}
		let incrementer = makeIncrementer()
		XCTAssertEqual(7+1, incrementer(7))
		
		// arg func ----------------------
		func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
			for item in list {
				if condition(item) {
					return true
				}
			}
			return false
		}
		func lessThenTen(number: Int) -> Bool {
			return number < 10
		}
		let number = [20, 19, 7, 12]
		XCTAssertTrue( hasAnyMatches(list: number, condition: lessThenTen) )
		
		//--------------------------------
	}
	
	func testSWIFT_Closure() {
		
		// {} ----------------------------
		let numbers = [20, 19, 7, 12]
		print("   >>> numbers.mapped : \(numbers)")
		let mapped = numbers.map({ (number: Int) -> Int in
			let result = 3 * number
			return result
		})
		print("   >>> numbers.mapped : \(mapped)")
		
		let mappedNumbers = numbers.map( { number in 3 * number } )
		print("   >>> \(mappedNumbers)")
		
		let sortedNumbers = numbers.sorted { $0 > $1 }
		print("   >>> \(sortedNumbers)")
		
		//--------------------------------
	}
	
	func testSWIFT_Class() {
		
		// class -------------------------
		class NamedShape {
			var numberOfSides: Int = 0
			var name: String
			
			init(name: String) {
				self.name = name
			}
			
			deinit {
				print("   >>> cean after shape")
			}
			
			func simpleDescription() -> String {
				return "A shape with \(numberOfSides) sides."
			}
		}
		
		// sub-class ---------------------
		class Square: NamedShape {
			var sideLength: Double
			
			init(sideLength: Double, name: String) {
				self.sideLength = sideLength
				super.init(name: name)
				numberOfSides = 4
			}
			
			func area() -> Double {
				return sideLength * sideLength
			}
			
			override func simpleDescription() -> String {
				return "A square with sides of length \(sideLength)."
			}
		}
		
		let test = Square(sideLength: 5.2, name: "my test square")
		print("   >>> test.area() : \(test.area())")
		print("   >>> test.simpleDescription() : \(test.simpleDescription())")
		
		// getter-setter -----------------
		class EquilateralTriangle: NamedShape {
			var sideLength: Double = 0.0
			
			init(sideLength: Double, name: String) {
				self.sideLength = sideLength
				super.init(name: name)
				numberOfSides = 3
			}
			
			var perimeter: Double {
				get {
					return 3.0 * sideLength
				}
				set (length) {
					sideLength = length / 3.0  // implicit : newValue
				}
			}
			
			override func simpleDescription() -> String {
				return "An equilateral triangle with sides of length \(sideLength)."
			}
		}
		
		let triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
		print("   >>> triangle.perimeter : \(triangle.perimeter)")
		triangle.perimeter = 9.9
		print("   >>> triangle.sideLength : \(triangle.sideLength)")
		
		// will-did set ------------------
		class TriangleAndSquare {
			var triangle: EquilateralTriangle {
				willSet {
					square.sideLength = newValue.sideLength
				}
			}
			var square: Square {
				willSet {
					triangle.sideLength = newValue.sideLength
				}
			}
			init(size: Double, name: String) {
				square = Square(sideLength: size, name: name)
				triangle = EquilateralTriangle(sideLength: size, name: name)
			}
		}
		
		let triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
		XCTAssertEqual(10.0, triangleAndSquare.square.sideLength)
		XCTAssertEqual(10.0, triangleAndSquare.triangle.sideLength)
		triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
		XCTAssertEqual(50.0, triangleAndSquare.triangle.sideLength)
		
		// nil ---------------------------
		var optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
		var sideLength = optionalSquare?.sideLength
		XCTAssertNotNil(sideLength)
		optionalSquare = nil
		sideLength = optionalSquare?.sideLength // if nill? - other just ignored = nil
		XCTAssertNil(sideLength)
		
		//--------------------------------
	}
}
