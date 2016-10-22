import XCTest

class PassingCars: XCTestCase {

    func DISABLED_testExample() {
        let expected = 5
        var input = [0, 1, 0, 1, 1]

        let output = solution(&input)

        XCTAssertEqual(expected, output)
    }

    func testNoPairPassing() {
        let expected = 0
        var input = [0]

        let output = solution(&input)

        XCTAssertEqual(expected, output)
    }

    public func solution(_ A : inout [Int]) -> Int {
        return 0
    }
}
