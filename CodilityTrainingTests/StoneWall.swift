import XCTest

class StoneWall: XCTestCase {

    func DISABLED_testExample() {
        var H = [8, 8, 5, 7, 9, 8, 7, 4, 8]

        let result = solution(&H)

        XCTAssertEqual(9, result)
    }

    func testEmptyWall() {
        var H = [Int]()

        let result = solution(&H)

        XCTAssertEqual(0, result)
    }

    func testUniformWall() {
        var H = [5, 5, 5]

        let result = solution(&H)

        XCTAssertEqual(1, result)
    }

    func testTwoDimensionsWall() {
        var H = [5, 5, 4]

        let result = solution(&H)

        XCTAssertEqual(2, result)
    }

    func testTwoDimensionsNotContiguousWall() {
        var H = [5, 4, 5]

        let result = solution(&H)

        XCTAssertEqual(3, result)
    }

    public func solution(_ H : inout [Int]) -> Int {
        var heights = Set<Int>()
        for height in H {
            if !heights.contains(height) {
                heights.insert(height)
            }
        }
        return heights.count
    }
}

