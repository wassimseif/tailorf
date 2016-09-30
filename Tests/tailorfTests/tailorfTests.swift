import XCTest
@testable import tailorf

class tailorfTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(tailorf().text, "Hello, World!")
    }


    static var allTests : [(String, (tailorfTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
