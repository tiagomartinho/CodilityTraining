import XCTest

class NumberOfDiscIntersections: XCTestCase {

    func testExample() {
        let expected = 11
        var A = [1, 5, 2, 1, 4, 0]
        let result = solution(&A)

        XCTAssertEqual(expected, result)
    }

    func testOneCircleDoesNotIntersect() {
        let expected = 0
        var A = [1]
        let result = solution(&A)

        XCTAssertEqual(expected, result)
    }

    func testTwoCirclesThatIntersect() {
        let expected = 1
        var A = [1, 5]
        let result = solution(&A)

        XCTAssertEqual(expected, result)
    }

    func testThreeCirclesThatIntersect() {
        let expected = 3
        var A = [1, 5, 8]
        let result = solution(&A)

        XCTAssertEqual(expected, result)
    }

    let maxIntersections = 10_000_000

    public func solution(_ A : inout [Int]) -> Int {

        let (upperRange, lowerRange) = calculateUpperAndLowerRange(A)

        var rangeLowerIndex = 0
        var intersections = 0

        for rangeUpperIndex in 0..<A.count {

            while rangeLowerIndex < A.count && upperRange[rangeUpperIndex] >= lowerRange[rangeLowerIndex] {
                rangeLowerIndex += 1
            }

            intersections += rangeLowerIndex - rangeUpperIndex - 1

            if intersections > maxIntersections {
                return -1
            }
        }
        
        return intersections
    }

    func calculateUpperAndLowerRange(_ A: [Int]) -> ([Int], [Int]) {
        let discsCount = A.count
        var upperRange = [Int](repeating: 0, count: discsCount)
        var lowerRange = [Int](repeating: 0, count: discsCount)

        for (center,radius) in A.enumerated() {
            upperRange[center] = center + radius
            lowerRange[center] = center - radius
        }

        upperRange.sort()
        lowerRange.sort()

        return (upperRange, lowerRange)
    }
}
