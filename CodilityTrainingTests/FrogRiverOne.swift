import XCTest

class FrogRiverOne: XCTestCase {

    func testExample() {
        let expected = 6
        let x = 5
        var input = [1, 3, 1, 4, 2, 3, 5, 4]

        let output = solution(x, &input)

        XCTAssertEqual(expected, output)
    }

    func testOppositeBankAlreadyReachable() {
        let expected = -1
        let x = 0
        var input = [1, 3, 1, 4, 2, 3, 5, 4]

        let output = solution(x, &input)

        XCTAssertEqual(expected, output)
    }

    func testOppositeBankOneJumpAway() {
        let expected = 6
        let x = 1
        var input = [3, 4, 2, 3, 5, 4, 1]

        let output = solution(x, &input)

        XCTAssertEqual(expected, output)
    }

    public func solution(_ X : Int, _ A : inout [Int]) -> Int {
        if X <= 0 {
            return -1
        }
        var leaves = Set<Int>()
        for (index, leaf) in A.enumerated() {
            if leaf <= X {
                leaves.insert(leaf)
            }
            if leaves.count == X {
                return index
            }
        }
        return -1
    }
}
