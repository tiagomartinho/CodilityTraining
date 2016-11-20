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
        for (query, _) in P.enumerated() {
            let minimalImpact = calculatesMinimalImpact(startIndex: P[query], endIndex: Q[query], S: S)
            minimalImpactFactors.append(minimalImpact)
        }
        return minimalImpactFactors
    }

    public func calculatesMinimalImpact(startIndex: Int, endIndex: Int, S: String) -> Int {
        let impactFactors: [Character: Int] = ["A": 1, "C": 2, "G": 3, "T": 4]
        var minimalImpactForQuery = 4
        for index in startIndex...endIndex {
            let nucleotide = S[S.index(S.startIndex, offsetBy: index)]
            if let impact = impactFactors[nucleotide] {
                if impact < minimalImpactForQuery {
                    minimalImpactForQuery = impact
                }
            }
        }
        return minimalImpactForQuery
    }
}
