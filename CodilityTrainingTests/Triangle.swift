import XCTest

class Triangle: XCTestCase {

    func testExample() {
        let expected = 1
        var A = [10, 2, 5, 1, 8, 20]

        let result = solution(&A)

        XCTAssertEqual(expected, result)
    }

    func testAnotherExample() {
        let expected = 0
        var A = [10, 50, 5, 1]

        let result = solution(&A)

        XCTAssertEqual(expected, result)
    }

    public func solution(_ A : inout [Int]) -> Int {
        var isTriangle = 0
        if A.count < 3 { return isTriangle }
        let sorted = A.sorted()
        for (index, _) in sorted.enumerated() {
            if index == sorted.count - 2 { break }
            if sorted[index] + sorted[index+1] > sorted[index+2] &&
                sorted[index+1] + sorted[index+2] > sorted[index] &&
                sorted[index] + sorted[index+2] > sorted[index+1] {
                isTriangle = 1
                break
            }
        }
        return isTriangle
    }
}
