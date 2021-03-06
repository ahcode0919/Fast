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

    static var allTests = [
        ("testChomp", testChomp),
    ]
}
