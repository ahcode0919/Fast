//
//  Array+ExtensionTests.swift
//  
//
//  Created by Aaron Hinton on 1/12/23.
//

@testable import Fast
import XCTest

final class ArrayExtensionTests: XCTestCase {
    
    func testRandomDoubleArray() throws {
        let range: Range<Double> = 0..<1_000
        let randomArr = [Double].random(range: range, size: 100)
        let valuesOutsideOfRange = randomArr.filter { !range.contains($0) }
        XCTAssertTrue(valuesOutsideOfRange.isEmpty)
    }

    func testRandomFloatArray() throws {
        let range: Range<Float> = 0..<1_000
        let randomArr = [Float].random(range: range, size: 100)
        let valuesOutsideOfRange = randomArr.filter { !range.contains($0) }
        XCTAssertTrue(valuesOutsideOfRange.isEmpty)
    }
    
    func testRandomIntArray() throws {
        let range: Range<Int> = 0..<1_000
        let randomArr = [Int].random(range: range, size: 100)
        let valuesOutsideOfRange = randomArr.filter { !range.contains($0) }
        XCTAssertTrue(valuesOutsideOfRange.isEmpty)
    }
    
    func testRandomUIntArray() throws {
        let range: Range<UInt> = 0..<1_000
        let randomArr = [UInt].random(range: range, size: 100)
        let valuesOutsideOfRange = randomArr.filter { !range.contains($0) }
        XCTAssertTrue(valuesOutsideOfRange.isEmpty)
    }
}
