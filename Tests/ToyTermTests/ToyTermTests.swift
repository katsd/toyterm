import XCTest
@testable import ToyTerm

final class ToyTermTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ToyTerm().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
