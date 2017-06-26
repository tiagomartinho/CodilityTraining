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

    public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
        guard A.count == B.count else { return 0 }

        var downstreamCount = 0
        var upstreamFishes = [Int]()
        for (index, direction) in B.enumerated() {

            let currentFish = A[index]
            let isDownstream = direction == 1

            if isDownstream {
                upstreamFishes.append(currentFish)
            } else {
                downstreamCount += 1
                while !upstreamFishes.isEmpty {
                    let upstreamFish = upstreamFishes.removeLast()
                    if currentFish < upstreamFish {
                        upstreamFishes.append(upstreamFish)
                        downstreamCount -= 1
                        break
                    }
                }
            }
        }
        return downstreamCount + upstreamFishes.count
    }
}

