import XCTest

class GenomicRangeQuery: XCTestCase {

    func testExample() {
        let expected = [2, 4, 1]
        var S = "CAGCCTA"
        var P = [2, 5, 0]
        var Q = [4, 5, 6]

        let output = solution(&S, &P, &Q)

        XCTAssertEqual(expected, output)
    }

    func testCorrectImpactFactor() {
        let expected = [1, 2, 3, 4]
        var S = "ACGT"
        var P = [0, 1, 2, 3]
        var Q = [0, 1, 2, 3]

        let output = solution(&S, &P, &Q)

        XCTAssertEqual(expected, output)
    }

    public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
        var minimalImpactFactors = [Int]()
        for (index, _) in P.enumerated() {
            let query = Query(startIndex: P[index], endIndex: Q[index])
            let minimalImpact = calculatesMinimalImpact(query: query, S: S)
            minimalImpactFactors.append(minimalImpact)
        }
        return minimalImpactFactors
    }

    public func calculatesMinimalImpact(query: Query, S: String) -> Int {
        let minimumImpact = 1
        let impactFactors: [Character: Int] = ["A": 1, "C": 2, "G": 3, "T": 4]
        var minimalImpactForQuery = 4
        for index in query.startIndex...query.endIndex {
            let nucleotide = S[S.index(S.startIndex, offsetBy: index)]
            if let impact = impactFactors[nucleotide] {
                if impact == minimumImpact { return minimumImpact }
                if impact < minimalImpactForQuery {
                    minimalImpactForQuery = impact
                }
            }
        }
        return minimalImpactForQuery
    }
}

public struct Query {
    let startIndex: Int
    let endIndex: Int
}
