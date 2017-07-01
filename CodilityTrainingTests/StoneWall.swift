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

    func testTwoDimensionsNotContiguousWallUpward() {
        var H = [5, 6, 5]

        let result = solution(&H)

        XCTAssertEqual(2, result)
    }

    func testThreeTowersWall() {
        var H = [1, 0, 1, 0, 1]

        let result = solution(&H)

        XCTAssertEqual(3, result)
    }

    public func solution(_ H : inout [Int]) -> Int {
        var heights = [[Int]]()
        for height in H {
            if let lastHeight = heights.last?.last {
                if height != lastHeight {
                    let count = heights.count-1
                    if height < lastHeight {
                        heights[count].append(height)
                    } else {
                        heights[count].insert(height, at: 0)
                    }
                }
            } else {
                heights.append([height])
            }
        }
        heights = heights.map { $0.filter { $0 != 0 } }
        return heights.reduce(0) { $0 + $1.count }
    }
}

