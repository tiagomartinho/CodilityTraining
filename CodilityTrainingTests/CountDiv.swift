import XCTest

class CountDiv: XCTestCase {

    func testExample() {
        let expected = 3

        let output = solution(6, 11, 2)

        XCTAssertEqual(expected, output)
    }

    func testPerformance() {
        self.measure {
            _ = self.solution(100, 10000000, 2)
        }
    }

    public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int {
        let b = integersFromZero(to: B, divisibleBy: K)
        var a = integersFromZero(to: A, divisibleBy: K)
        if isInclusive(A, K) {
            a -= 1
        }
        return b-a
    }

    func integersFromZero(to: Int, divisibleBy: Int) -> Int {
        return to/divisibleBy + 1
    }

    func isInclusive(_ A : Int, _ K : Int) -> Bool {
        return A%K == 0
    }
}
