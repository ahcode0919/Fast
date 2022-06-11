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

    func testWithQuotes() {
        XCTAssertEqual("foo".withQuotes(), "\"foo\"")
        XCTAssertEqual("".withQuotes(), "\"\"")
        XCTAssertEqual("\"foo\"".withQuotes(), "\"foo\"")
    }
}
