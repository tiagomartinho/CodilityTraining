import XCTest

class Distinct: XCTestCase {

    func testExample() {
        let expected = 3
        var A = [2, 1, 1, 2, 3, 1]

        let result = solution(&A)

        XCTAssertEqual(expected, result)
    }

    public func solution(_ A : inout [Int]) -> Int {
        var numbers = Set<Int>()
        for number in A {
            numbers.insert(number)
        }
        return numbers.count
    }
}
