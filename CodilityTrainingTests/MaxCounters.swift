import XCTest

class MaxCounters: XCTestCase {

    func testExample() {
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

    func testWrongInputIsIgnored() {
        let expected = [2, 1]
        let N = 2
        let wrongInput = 9999
        let anotherWrongInput = -9999
        var input = [1, 2, wrongInput, 1, anotherWrongInput]

        let output = solution(N, &input)

        XCTAssertEqual(expected, output)
    }

    func testMaxCounters() {
        let expected = [2, 2]
        let N = 2
        var input = [1, 2, 1, 3]

        let output = solution(N, &input)

        XCTAssertEqual(expected, output)
    }

    func testPerformanceExample() {
        let N = 10000
        let increaseCounter = [Int](repeating: 1, count: N)
        let maxCounter = [Int](repeating: N + 1, count: N)
        var input = increaseCounter + maxCounter + increaseCounter + maxCounter

        self.measure {
            _ = self.solution(N, &input)
        }
    }

    public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
        var counters: [Int]? = [Int](repeating: 0, count: N)
        var maxCounter = 0
        for operation in A {
            let index = operation - 1
            if index >= 0 && index < N {
                if counters == nil {
                    counters = [Int](repeating: maxCounter, count: N)
                }
                counters![index] = counters![index] + 1
                if counters![index] > maxCounter {
                    maxCounter = counters![index]
                }
            }
            if operation == (N + 1) {
                counters = nil
            }
        }
        if let counters = counters {
            return counters
        } else {
            return [Int](repeating: maxCounter, count: N)
        }
    }
}
