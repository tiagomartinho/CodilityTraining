import XCTest

class StoneWall: XCTestCase {

    func testExample() {
        var H = [8, 8, 5, 7, 9, 8, 7, 4, 8]

        let result = solution(&H)

        XCTAssertEqual(7, result)
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

    func testTwoDimensionsNotContiguousWallUpward() {
        var H = [5, 6, 5]

        let result = solution(&H)

        XCTAssertEqual(2, result)
    }

    public func solution(_ H : inout [Int]) -> Int {
        var count = 0
        var heights = [Int]()
        for height in H {
            while !heights.isEmpty && heights.last! > height {
                heights.removeLast()
            }
            if heights.isEmpty || heights.last! < height {
                heights.append(height)
                count += 1
            }
        }
        return count
    }
}

