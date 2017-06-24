import XCTest

class Fish: XCTestCase {

    func testExample() {
        var A = [4, 3, 2, 1, 5]
        var B = [0, 1, 0, 0, 0]

        let result = solution(&A, &B)

        XCTAssertEqual(2, result)
    }

    func testAnotherExample() {
        var A = [4, 3, 2, 1, 5, 6]
        var B = [0, 1, 0, 0, 0, 1]

        let result = solution(&A, &B)

        XCTAssertEqual(3, result)
    }

    func testLonelyFishStaysAlive() {
        var A = [4]
        var B = [0]

        let result = solution(&A, &B)

        XCTAssertEqual(1, result)
    }

    func testFishesInTheSameDirectionStayAlive() {
        var A = [4, 3, 2, 1, 5]
        var B = [1, 1, 1, 1, 1]

        let result = solution(&A, &B)

        XCTAssertEqual(5, result)
    }

    func testFishesInOppositeDirectionOnlyTheBiggerStaysAlive() {
        var A = [4, 3]
        var B = [1, 0]

        let result = solution(&A, &B)

        XCTAssertEqual(1, result)
    }

    func testSurvivorsUpstream() {
        let downstreamFishes = [1, 2]
        let upstreamFishes = [4, 3]

        let result = survivors(downstreamFishes: downstreamFishes, upstreamFishes: upstreamFishes)

        XCTAssertEqual(2, result)
    }

    func testSurvivorsDownstream() {
        let downstreamFishes = [1, 2, 3]
        let upstreamFishes = [Int]()

        let result = survivors(downstreamFishes: downstreamFishes, upstreamFishes: upstreamFishes)

        XCTAssertEqual(3, result)
    }

    func testSurvivorsUpstreamOnly() {
        let downstreamFishes = [Int]()
        let upstreamFishes = [1, 2, 3]

        let result = survivors(downstreamFishes: downstreamFishes, upstreamFishes: upstreamFishes)

        XCTAssertEqual(3, result)
    }

    func testSurvivorsDownstreamOnly() {
        let downstreamFishes = [1, 2, 3]
        let upstreamFishes = [Int]()

        let result = survivors(downstreamFishes: downstreamFishes, upstreamFishes: upstreamFishes)

        XCTAssertEqual(3, result)
    }

    func testSurvivorsShark() {
        let downstreamFishes = [1, 2, 3]
        let upstreamFishes = [10]

        let result = survivors(downstreamFishes: downstreamFishes, upstreamFishes: upstreamFishes)

        XCTAssertEqual(1, result)
    }

    public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
        guard A.count == B.count else { return 0 }

        var downstreamFishes = [Int]()
        var upstreamFishes = [Int]()
        for (index, direction) in B.enumerated() {

            let isDownstream = direction == 1

            if (isDownstream && !downstreamFishes.isEmpty && !upstreamFishes.isEmpty) || (isDownstream && !upstreamFishes.isEmpty) {
                var remainingA = Array(A.suffix(from: index))
                var remainingB = Array(B.suffix(from: index))
                return survivors(downstreamFishes: downstreamFishes, upstreamFishes: upstreamFishes) + solution(&remainingA, &remainingB)
            }

            isDownstream ? downstreamFishes.append(A[index]) : upstreamFishes.append(A[index])
        }
        return survivors(downstreamFishes: downstreamFishes, upstreamFishes: upstreamFishes)
    }

    public func survivors(downstreamFishes: [Int], upstreamFishes: [Int]) -> Int {
        var downstream = downstreamFishes
        var upstream = upstreamFishes
        while !downstream.isEmpty && !upstream.isEmpty {
            if downstream.first! > upstream.first! {
                upstream.removeFirst()
            } else {
                downstream.removeFirst()
            }
        }
        return downstream.count + upstream.count
    }
}
