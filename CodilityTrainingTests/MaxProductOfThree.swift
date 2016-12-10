import XCTest

class MaxProductOfThree: XCTestCase {

    func testExample() {
        let expected = 60
        var A = [-3, 1, 2, -2, 5, 6]

        let result = solution(&A)

        XCTAssertEqual(expected, result)
    }

    public func solution(_ A : inout [Int]) -> Int {
        if A.count < 3 { return 0 }

        let sorted = A.sorted()

        let negativeMaximum0 = sorted[0]
        let negativeMaximum1 = sorted[1]
        let negativeMaximum2 = sorted[2]

        let positiveMaximum0 = sorted[A.count-3]
        let positiveMaximum1 = sorted[A.count-2]
        let positiveMaximum2 = sorted[A.count-1]

        var maximum = negativeMaximum0 * negativeMaximum1 * negativeMaximum2

        let positiveMaximum = positiveMaximum0 * positiveMaximum1 * positiveMaximum2
        if positiveMaximum > maximum {
            maximum = positiveMaximum
        }

        let negativeAndPositiveMaximum = negativeMaximum0 * negativeMaximum1 * positiveMaximum2
        if negativeAndPositiveMaximum > maximum {
            maximum = negativeAndPositiveMaximum
        }

        return maximum
    }
}
