import XCTest

class MaxCounters: XCTestCase {
    func testExample() {
        let expected = [3, 2, 2, 4, 2]
        let N = 5
        var input = [3, 4, 4, 6, 1, 4, 4]

        let output = solution(N, &input)

        XCTAssertEqual(expected, output)
    }

    public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
        return [Int]()
    }
}
