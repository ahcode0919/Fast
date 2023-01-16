//
//  CountedSetTestCases.swift
//  
//
//  Created by Aaron Hinton on 1/15/23.
//

@testable import Fast
import XCTest

class CountedSetTestCases: XCTestCase {
    
    func testAdd() {
        let set = CountedSet<Int>()
        set.add(1)
        XCTAssertEqual(set.count(for: 1), 1)
        
        set.add(1)
        XCTAssertEqual(set.count(for: 1), 2)
    }
    
    func contains() {
        let set = CountedSet<Int>(values: [1])
        XCTAssertTrue(set.contains(1))
    }
    
    func testCount() {
        let set = CountedSet<Int>(values: [1, 2, 3, 3, 3])
        XCTAssertEqual(set.count, 3)
    }
    
    func testCountFor() {
        let set = CountedSet<Int>(values: [1, 2, 3, 3, 3])
        XCTAssertEqual(set.count(for: 1), 1)
        XCTAssertEqual(set.count(for: 3), 3)
        XCTAssertEqual(set.count(for: 6), 0)
    }
    
    func testEquatable() {
        var set1 = CountedSet<Int>()
        var set2 = CountedSet<Int>()
        XCTAssertEqual(set1, set2)
        
        set1 = CountedSet<Int>()
        set2 = CountedSet<Int>(values: [1, 2, 3])
        XCTAssertNotEqual(set1, set2)
        
        set1 = CountedSet<Int>(values: [1, 2, 3])
        set2 = CountedSet<Int>(values: [1, 2, 3])
        XCTAssertEqual(set1, set2)
        
        set1 = CountedSet<Int>(values: [1, 2, 3])
        set2 = CountedSet<Int>(values: [1, 2, 3, 3])
        XCTAssertNotEqual(set1, set2)
    }

    func testInitializer() {
        var set = CountedSet<Int>()
        XCTAssertTrue(set.isEmpty)
        
        set = CountedSet<Int>(values: [])
        XCTAssertEqual(set.count, 0)
        
        set = CountedSet<Int>(capacity: 100)
        XCTAssertTrue(set.isEmpty)
        
        let intSet: Set<Int> = [1, 2, 3, 3]
        set = CountedSet<Int>(set: intSet)
        XCTAssertEqual(set.count, 3)
        XCTAssertEqual(set.count(for: 3), 1)
        
        set = CountedSet<Int>(values: [1, 2, 3, 3])
        XCTAssertEqual(set.count(for: 3), 2)
    }
    
    func testIsEmpty() {
        let set = CountedSet<Int>()
        XCTAssertTrue(set.isEmpty)
        
        set.add(1)
        XCTAssertFalse(set.isEmpty)
    }
    
    func testMakeIterator() throws {
        let set = CountedSet<Int>(values: [1, 2, 3])
        var iterator = set.makeIterator()
        let value = try XCTUnwrap(iterator.next() as? Int)
        XCTAssertTrue(set.contains(value))
    }

    func testRemove() {
        let set = CountedSet<Int>(values: [1, 2, 3, 3])
        set.remove(3)
        XCTAssertEqual(set.count(for: 3), 1)
        
        set.remove(3)
        XCTAssertEqual(set.count(for: 3), 0)
    }
    
    func testValues() {
        let set = CountedSet<Int>(values: [1, 2, 3, 3])
        let values = set.values()
        XCTAssertEqual(set.count, values.count)
        XCTAssertEqual([1, 2, 3], values.sorted())
    }
    
    func testValuesByCount() {
        let set = CountedSet<Int>(values: [1, 2, 3, 3])
        let values = set.valuesByCount()
        XCTAssertNotEqual(set.count, values.count)
        XCTAssertEqual([1, 2, 3, 3], values.sorted())
    }
}
