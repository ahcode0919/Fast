//
//  OrderedSetTests.swift
//  
//
//  Created by Aaron Hinton on 1/7/23.
//

@testable import Fast
import XCTest

class OrderedSetTests: XCTestCase {
    func testAdd() {
        let orderedSet = OrderedSet<Int>()
        orderedSet.add(1)
        XCTAssertEqual(orderedSet.count, 1)

        orderedSet.add(2)
        XCTAssertEqual(orderedSet.count, 2)
        XCTAssertEqual(orderedSet.values(), [1, 2])
    }
    
    func testContains() {
        let orderedSet = OrderedSet<Int>()
        XCTAssertFalse(orderedSet.contains(1))
        
        orderedSet.add(1)
        XCTAssertTrue(orderedSet.contains(1))
        XCTAssertFalse(orderedSet.contains(2))
    }
    
    func testEquatable() {
        let orderedSet = OrderedSet<Int>([1, 2, 3])
        let matchingOrderedSet = OrderedSet<Int>([1, 2, 3])
        XCTAssertEqual(orderedSet, matchingOrderedSet)

        let reversedOrderedSet = OrderedSet<Int>([3, 2, 1])
        XCTAssertNotEqual(orderedSet, reversedOrderedSet)

        let nonMatchingOrderedSet = OrderedSet<Int>([1, 1, 1])
        XCTAssertNotEqual(orderedSet, nonMatchingOrderedSet)
    }
    
    func testInitializer() {
        let orderedSet = OrderedSet<Int>()
        XCTAssertTrue(orderedSet.isEmpty)
    }
    
    func testInitializeWithValues() {
        let orderedSet = OrderedSet<Int>([1, 2, 3, 4, 5])
        XCTAssertEqual(orderedSet.values(), [1, 2, 3, 4, 5])
    }
    
    func testIsEmpty() {
        let orderedSet = OrderedSet<Int>()
        XCTAssertTrue(orderedSet.isEmpty)
        
        orderedSet.add(1)
        XCTAssertFalse(orderedSet.isEmpty)
    }
    
    func testMakeIterator() {
        let setValues = [1, 2, 3]
        let orderedSet = OrderedSet<Int>(setValues)
        var iterator = orderedSet.makeIterator()
        var values = [Int]()
        
        while let value = iterator.next() as? Int {
            values.append(value)
        }
        XCTAssertEqual(values, setValues)
    }

    func testOrder() {
        let orderedSet = OrderedSet<Int>()
        let values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        values.forEach { orderedSet.add($0) }
        XCTAssertEqual(orderedSet.values(), values)
    }
    
    func testValues() {
        var orderedSet = OrderedSet<Int>()
        XCTAssertEqual(orderedSet.values(), [])

        let values = [1, 2, 3]
        orderedSet = OrderedSet<Int>(values)
        XCTAssertEqual(orderedSet.values(), values)
    }
}
