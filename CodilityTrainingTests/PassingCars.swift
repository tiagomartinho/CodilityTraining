import XCTest

class PassingCars: XCTestCase {

    func testExample() {
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

    func testNoPairPassingWithMultipleCars() {
        let expected = 0
        var input = [1, 1, 1, 1]

        let output = solution(&input)

        XCTAssertEqual(expected, output)
    }

    func testOnePairPassing() {
        let expected = 1
        var input = [0, 1]

        let output = solution(&input)

        XCTAssertEqual(expected, output)
    }

    func testMultiplePairPassingWithOnlyOneEastCar() {
        let expected = 3
        var input = [0, 1, 1, 1]

        let output = solution(&input)

        XCTAssertEqual(expected, output)
    }

    func testTwoPairPassing() {
        let expected = 4
        var input = [0, 0, 1, 1]

        let output = solution(&input)

        XCTAssertEqual(expected, output)
    }

    func testPerformanceExample() {
        let N = 50000
        let travelingEast = [Int](repeating: 0, count: N)
        let travelingWest = [Int](repeating: 1, count: N)
        var input = travelingEast + travelingWest

        self.measure {
            let expected = -1
            let output = self.solution(&input)
            XCTAssertEqual(expected, output)
        }
    }

    public func solution(_ A : inout [Int]) -> Int {
        let travelingEast = 0
        let travelingWest = 1

        var counting = false
        var currentPair = 0
        var pairsOfPassingCarsAndMultipliers = [(Int, Int)]()
        for car in A {
            if counting {
                if car == travelingWest {
                    pairsOfPassingCarsAndMultipliers[currentPair].0 += 1
                }
                if car == travelingEast {
                    currentPair += 1
                    pairsOfPassingCarsAndMultipliers.append((0, currentPair + 1))
                }
            } else {
                if car == travelingEast {
                    counting = true
                    pairsOfPassingCarsAndMultipliers.append((0, 1))
                }
            }
        }

        return pairsOfPassingCarsAndMultipliers.reduce(0) { (accumulator: Int, pairsOfPassingCarsAndMultipliers: (Int, Int)) -> Int in
            if accumulator == -1 || accumulator > 1000000000 {
                return -1
            }
            let result = accumulator + pairsOfPassingCarsAndMultipliers.0 * pairsOfPassingCarsAndMultipliers.1
            if result > 1000000000 {
                return -1
            } else {
                return result
            }
        }
    }
}
