import XCTest

class StoneWall: XCTestCase {

    func testExample() {
        var H = [8, 8, 5, 7, 9, 8, 7, 4, 8]

        let result = solution(&H)

        XCTAssertEqual(9, result)
    }

    public func solution(_ H : inout [Int]) -> Int {
        return 0
    }
}

