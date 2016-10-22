import XCTest

class PassingCars: XCTestCase {

    func DISABLED_testExample() {
        let expected = 5
        var input = [0, 1, 0, 1, 1]

        let output = solution(&input)

        XCTAssertEqual(expected, output)
    }

    func testNoPairPassing() {
        let expected = 0
        var input = [0]

        let output = solution(&input)

        XCTAssertEqual(expected, output)
    }

    func testOnePairPassing() {
        let expected = 1
        var input = [0, 1]

        let output = solution(&input)

        XCTAssertEqual(expected, output)
    }

    public func solution(_ A : inout [Int]) -> Int {
        let travelingEast = 0
        let travelingWest = 1

        var pairsOfPassingCars = 0
        var isTravelingEast = false
        for car in A {
            if car == travelingEast {
                isTravelingEast = true
            }
            if car == travelingWest && isTravelingEast {
                pairsOfPassingCars += 1
            }
        }
        return pairsOfPassingCars
    }
}
