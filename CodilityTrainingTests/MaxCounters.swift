import XCTest

class MaxCounters: XCTestCase {

    func DISABLED_testExample() {
        let expected = [3, 2, 2, 4, 2]
        let N = 5
        var input = [3, 4, 4, 6, 1, 4, 4]

        let output = solution(N, &input)

        XCTAssertEqual(expected, output)
    }

    func testInitOneCounter() {
        let expected = [0]
        let N = 1
        var input = [Int]()

        let output = solution(N, &input)

        XCTAssertEqual(expected, output)
    }

    func testIncreaseOneCounter() {
        let expected = [1]
        let N = 1
        var input = [1]

        let output = solution(N, &input)

        XCTAssertEqual(expected, output)
    }

    func testIncreaseTwoCounters() {
        let expected = [2, 1]
        let N = 2
        var input = [1, 2, 1]

        let output = solution(N, &input)

        XCTAssertEqual(expected, output)
    }

    public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
        var counters = [Int](repeating: 0, count: N)
        for operation in A {
            let index = operation - 1
            counters[index] = counters[index] + 1
        }
        return counters
    }
}
