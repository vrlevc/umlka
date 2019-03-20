//
//  swiftTour_Tests.swift
//  umlkaTests
//
//  Created by Viktor Levchenko on 3/14/19.
//  Copyright © 2019 LVA. All rights reserved.
//

import XCTest

// protocol ----------------------
protocol ExampleProtocol {
	var simpleDescription: String { get }
	mutating func adjust()
}

// extension ---------------------
extension Int: ExampleProtocol {
	var simpleDescription: String {
		return "The number \(self)"
	}
	mutating func adjust() {
		self += 42
	}
}

// MARK: -

// TEST --------------------------
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
	
	func testSWIFT_Enum_Struct() {
		
		// enum --------------------------
		enum Rank: Int {
			case ace = 1
			case two, three, four, five, six, seven, eight, nine, ten
			case jack, queen, king
			
			func simpleDescription() -> String {
				switch self {
				case .ace:
					return "ace"
				case .jack:
					return "jack"
				case .queen:
					return "queen"
				case .king:
					return "king"
				default:
					return String(self.rawValue)
				}
			}
		}
		
		let ace = Rank.ace
		let aceRawValue = ace.rawValue
		XCTAssertEqual(1, aceRawValue)
		
		// rawValue ----------------------
		if let convertedRank = Rank(rawValue: 3) {
			print("   >>> \(convertedRank.simpleDescription())")
		}
		
		// -------------------------------
		enum Suit {
			case spades, hearts, diamonds, clubs
			
			func simpleDescription() -> String {
				switch self {
				case .spades:
					return "spades"
				case .hearts:
					return "hearts"
				case .diamonds:
					return "diamonds"
				case .clubs:
					return "clubs"
				}
			}
		}
		
		let hearts = Suit.hearts
		let heartsDescription = hearts.simpleDescription()
		print("   >>> \(heartsDescription)")
		
		// raw values --------------------
		enum ServerResponse {
			case result(String, String)
			case failure(String)
			
			func description() -> String {
				switch self {
				case let .result(sunrise, sunset):		/// !!!!! extracted - matching the value against the switch cases
					return "   >>> Sunrise is at \(sunrise) and sunset is at \(sunset)."
				case let .failure(error):				/// !!!!! extracted - matching the value against the switch cases
					return "   >>> Failure...  \(error)"
				}
			}
		}
		
		let success = ServerResponse.result("6:00 am", "8:09 pm")
		let failure = ServerResponse.failure("Out of cheese.")
		
		print("   >>> \(success.description())")
		print("   >>> \(failure.description())")
		
		/// ----------------------------------------------------------------------------///
		/// STRUCTURES are always COPIED when they are passed around in your code.		///
		/// CLASSES are PASSED BY REFERENCE when they are passed around in your code.	///
		/// ----------------------------------------------------------------------------///
		
		// struct ------------------------
		struct Card {
			var rank: Rank
			var suit: Suit
			func simpleDescription() -> String {
				return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
			}
		}
		
		let threeOfSpades = Card(rank: .three, suit: .spades)
		let threeOfSpadesDescription = threeOfSpades.simpleDescription()
		print("   >>> \(threeOfSpadesDescription)")
		
		//--------------------------------
	}
	
	func testSWIFT_Protocol_Extention() {
		
		// class : protocol --------------
		class SimpleClass: ExampleProtocol {
			var simpleDescription: String = "A very simple class."
			var anotherProperty: Int = 69105
			func adjust() {		/// !!!!!!! methods on a class can always modify the class
				simpleDescription += "  Now 100% adjusted."
			}
		}
		
		let a = SimpleClass()
		a.adjust()
		let aDescription = a.simpleDescription
		print("   >>> \(aDescription)")
		
		// struct : protocol -------------
		struct SimpleStructure: ExampleProtocol {
			var simpleDescription: String = "A simple structure"
			mutating func adjust() {		/// !!!!!!! mutating keyword - mark a method that modifies the structure
				simpleDescription += " (adjusted)"
			}
		}
		var b = SimpleStructure()
		b.adjust()
		let bDescription = b.simpleDescription
		print("   >>> \(bDescription)")

		// extension ---------------------
		print("   >>> \(7.simpleDescription)")
		
		// protocol ----------------------
		let protocolValue: ExampleProtocol = a
		print("   >>> \(protocolValue.simpleDescription)")
		// print(protocolValue.anotherProperty)  // Uncomment to see the error
		
		//--------------------------------
	}
	
	func testSWIFT_Error() {
		
		// Error -------------------------
		enum PrinterError: Error {
			case outOfPaper
			case noToner
			case onFire
		}
		
		// throw(s) ----------------------
		func send(job: Int, toPrinter printerName: String) throws -> String {
			if printerName == "Never Has Toner" {
				throw PrinterError.noToner
			}
			return "Job sent to \(printerName)"
		}
		
		// do-catch ----------------------
		do {
			let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
			print("   >>> \(printerResponse)")
			let failPrinterResponce = try send(job: 666, toPrinter: "Never Has Toner")
			print("   >>> \(failPrinterResponce)")
		} catch {
			print("   >>> \(error)")
		}
		
		// catch -------------------------
		do {
			let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
			print("   >>> \(printerResponse)")
		} catch PrinterError.onFire {
			print("   >>> I'll just put this over here, with the rest of the fire.")
		} catch let printerError as PrinterError {
			print("   >>> Printer error: \(printerError).")
		} catch {
			print("   >>> \(error)")
		}
		
		// try? --------------------------
		let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
		let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
		
		if let info = printerSuccess { print("   >>> \(info)") }
		if let info = printerFailure { print("   >>> \(info)") }
		
		// defer -------------------------
		var fridgeIsOpen = false
		let fridgeContent = ["milk", "eggs", "leftovers"]
		
		func fridgeContains(_ food: String) -> Bool {
			fridgeIsOpen = true			// --  SETUP  --
			defer {		/// !!!!!!! executed after all other code in the function even is throws error
				fridgeIsOpen = false	// -- CLEANUP --
			}
			
			let result = fridgeContent.contains(food)
			return result
		}
		
		print("   >>> fridgeContains(banana) : \(fridgeContains("banana"))")
		print("   >>> fridgeIsOpen : \(fridgeIsOpen)")
		
		//--------------------------------
	}
	
	func testSWIFT_Generics() {
		
		// <> ----------------------------
		func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
			var result = [Item]()
			for _ in 0..<numberOfTimes {
				result.append(item)
			}
			return result
		}
		
		let array = makeArray(repeating: "knock", numberOfTimes: 4)
		print("   >>> \(array)")
		
		// <> enum -----------------------
		/// - Reimplement the Swift standard library's optional type -
		enum OptionalValue<Wrapped> {
			case none
			case some(Wrapped)
		}
		var possibleInteger: OptionalValue<Int> = .none
		print("   >>> \(possibleInteger)")
		possibleInteger = .some(100)
		print("   >>> \(possibleInteger)")
		
		// where -------------------------
		func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
			where T.Element: Equatable, T.Element == U.Element
		{
			for lhsItem in lhs {
				for rhsItem in rhs {
					if lhsItem == rhsItem {
						return true
					}
				}
			}
			return false
		}
		
		let res = anyCommonElements([1, 2, 3], [3])
		print("   >>> \(res)")
		
		/// Writing <T: Equatable> is the same as writing <T> ... where T: Equatable.
		
		//--------------------------------
	}
}
