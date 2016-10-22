import XCTest

class PassingCars: XCTestCase {

    func testExample() {
        let expected = 5
        var input = [0, 1, 0, 1, 1]

        let output = solution(&input)

        XCTAssertEqual(expected, output)
    }

    public func solution(_ A : inout [Int]) -> Int {
        return 0
    }
}
