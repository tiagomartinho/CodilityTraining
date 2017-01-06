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

    public func solution(_ A : inout [Int]) -> Int {
        let maxIntersections = 10_000_000
        var intersections = 0
        var circles = [Set<Int>]()

        for (center,radius) in A.enumerated() {
            var circle = Set<Int>()
            for point in center-radius...center+radius {
                circle.insert(point)
            }
            circles.append(circle)
        }

        for (index,circle) in circles.enumerated() {
            for otherCircle in circles.suffix(from: index + 1) {
                if !circle.intersection(otherCircle).isEmpty {
                    intersections += 1
                    if intersections >= maxIntersections {
                        return -1
                    }
                }
            }
        }

        return intersections
    }
}
