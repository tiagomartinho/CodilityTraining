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
        let N = 1000
        let travelingEast = [Int](repeating: 0, count: N)
        let travelingWest = [Int](repeating: 1, count: N)
        var input = travelingEast + travelingWest

        self.measure {
            _ = self.solution(&input)
        }
    }

    func testCarsTravellingWest() {
        let expected = 3
        var input = [0, 0, 1, 1, 1]

        let output = carsTravellingWest(&input)

        XCTAssertEqual(expected, output)
    }

    func testCarsTravellingEast() {
        let expected = 2
        var input = [0, 0, 1, 1, 1]

        let output = carsTravellingEast(&input)

        XCTAssertEqual(expected, output)
    }

    public func solution(_ A : inout [Int]) -> Int {
        let travelingEast = 0
        let travelingWest = 1

        var pairsOfPassingCars = 0
        for (index, car) in A.enumerated() {
            if car == travelingEast {
                for possiblePair in A.suffix(from: index) {
                    if possiblePair == travelingWest {
                        pairsOfPassingCars += 1
                    }
                }
            }
        }
        return pairsOfPassingCars
    }

    public func carsTravellingWest(_ A : inout [Int]) -> Int {
        return A.reduce(0) { (result, next) -> Int in
            return result + next
        }
    }

    public func carsTravellingEast(_ A : inout [Int]) -> Int {
        return A.count - carsTravellingWest(&A)
    }
}
