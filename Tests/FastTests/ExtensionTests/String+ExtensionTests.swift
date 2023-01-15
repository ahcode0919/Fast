import XCTest
@testable import Fast

final class StringExtensionTests: XCTestCase {
    func testChomp() {
        XCTAssertEqual("test".chomp(), "test")
        XCTAssertEqual(" test ".chomp(), "test")
        XCTAssertEqual(" \t\n\r\ntest \t \r\n \n ".chomp(), "test")
        XCTAssertEqual("test \n\r  ".chomp(), "test")
        XCTAssertEqual("test    \n ".chomp(), "test")
    }
    
    func testContainsPattern() {
        let phoneNumber = "312-678-2234"
        XCTAssertTrue(phoneNumber.contains(.phoneNumber))
        XCTAssertFalse(phoneNumber.contains(.link))
    }
    
    func testExtractDoubles() {
        let testString = "23 L00.456 45.4KG 5,6.7"
        XCTAssertEqual(testString.extractDoubles(), [23, 0.456, 45.4, 5, 6.7])
    }
    
    func testExtractInts() {
        let testString = "23 L456 45KG 5,6.7"
        XCTAssertEqual(testString.extractInts(), [23, 456, 45, 5, 6, 7])
    }
    
    func testRandom() {
        var randomStrings = Set<String>()
        for _ in 0..<100 {
            XCTAssertTrue(randomStrings.insert(String.random(length: 100)).inserted)
        }
    }

    func testWithQuotes() {
        XCTAssertEqual("foo".withQuotes(), "\"foo\"")
        XCTAssertEqual("".withQuotes(), "\"\"")
        XCTAssertEqual("\"foo\"".withQuotes(), "\"foo\"")
    }
}
