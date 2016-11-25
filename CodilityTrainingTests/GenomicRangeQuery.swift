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

    func testPerformanceExample() {
        let N = 1000
        var S = ""
        for _ in 1...N {
            S.append("G")
        }
        var P = [0, 0, 0, 0]
        var Q = [N-1, N-1, N-1, N-1]

        self.measure {
            let expected = [3, 3, 3, 3]
            let output = self.solution(&S, &P, &Q)
            XCTAssertEqual(expected, output)
        }
    }

    public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
        let impactFactors: [Character: Int] = ["A": 1, "C": 2, "G": 3, "T": 4]
        let characters = [Int](repeating: 0, count: S.characters.count)
        var prefixSum = [[Int]](repeating: characters, count: impactFactors.count)

        for (index,nucleotide) in S.characters.enumerated() {
            if(nucleotide == "A") {
                prefixSum[0][index] = 1
            }
            if(nucleotide == "C") {
                prefixSum[1][index] = 1
            }
            if(nucleotide == "G") {
                prefixSum[2][index] = 1
            }
            if(nucleotide == "T") {
                prefixSum[3][index] = 1
            }
        }

        for i in 1..<S.characters.count {
            for (j,_) in impactFactors.enumerated() {
                prefixSum[j][i] += prefixSum[j][i-1]
            }
        }

        var result = [Int](repeating: 0, count: P.count)

        for (index,_) in P.enumerated() {
            let x = P[index]
            let y = Q[index]

            for (a,_) in impactFactors.enumerated() {
                var sub = 0
                if x-1 >= 0 {
                    sub = prefixSum[a][x-1]
                }
                if prefixSum[a][y] - sub > 0 {
                    result[index] = a+1
                    break
                }
            }
        }

        return result
    }

    public func calculatesMinimalImpact(query: Query, S: String) -> Int {
        let minimumImpact = 1
        let impactFactors: [Character: Int] = ["A": 1, "C": 2, "G": 3, "T": 4]
        var minimalImpactForQuery = 4
        for index in query.startIndex...query.endIndex {
            if index >= S.characters.count { break }
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

extension Query: Hashable {
    public var hashValue: Int {
        return startIndex.hashValue + endIndex.hashValue
    }
}

extension Query: Equatable { }

public func ==(lhs: Query, rhs: Query) -> Bool {
    return lhs.startIndex == rhs.startIndex && lhs.startIndex == rhs.startIndex
}
