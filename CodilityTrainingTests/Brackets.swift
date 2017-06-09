import XCTest

class Brackets: XCTestCase {

    func testExampleProperlyNested() {
        let expected = 1
        var string = "{[()()]}"

        let result = solution(&string)

        XCTAssertEqual(expected, result)
    }

    func testExampleNotProperlyNested() {
        let expected = 0
        var string = "([)()]"

        let result = solution(&string)

        XCTAssertEqual(expected, result)
    }

    public func solution(_ S : inout String) -> Int {
        return 0
    }
}
