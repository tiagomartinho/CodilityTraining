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
        var divisibleNumbers = 0
        for i in A...B {
            if i % K == 0 {
                divisibleNumbers += 1
            }
        }
        return divisibleNumbers
    }
}
