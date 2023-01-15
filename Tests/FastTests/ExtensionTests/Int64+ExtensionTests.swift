//
//  Int64+ExtensionTests.swift
//  
//
//  Created by Aaron Hinton on 1/14/23.
//

import XCTest

final class Int64ExtensionTests: XCTestCase {
    func testByteFormattedByteString() {
        var bytes: Int64 = 100
        XCTAssertEqual(bytes.byteFormattedString(), "100 bytes")
        
        bytes = 100_000
        XCTAssertEqual(bytes.byteFormattedString(), "100 KB")

        bytes = 100_000_000
        XCTAssertEqual(bytes.byteFormattedString(), "100 MB")
        XCTAssertEqual(bytes.byteFormattedString(units: .useGB), "0.1 GB")
    }
}
