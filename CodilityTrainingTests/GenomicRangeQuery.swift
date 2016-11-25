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

    let impactFactors: [Character: Int] = ["A": 1, "C": 2, "G": 3, "T": 4]

    public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
        let prefixSum = computePrefixes(S)
        return calculateMinimal(P: P, Q: Q, prefixSum: prefixSum)
    }

    public func calculateMinimal(P: [Int], Q: [Int], prefixSum: [[Int]]) -> [Int] {
        var result = [Int](repeating: 0, count: P.count)
        for (index,_) in P.enumerated() {
            let start = P[index]
            let end = Q[index]
            for (nucleotide,_) in impactFactors.enumerated() {
                var minimum = 0
                if start - 1 >= 0 {
                    minimum = prefixSum[nucleotide][start-1]
                }
                if prefixSum[nucleotide][end] - minimum > 0 {
                    result[index] = nucleotide + 1
                    break
                }
            }
        }
        return result
    }

    public func computePrefixes(_ S: String) -> [[Int]] {
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
        return prefixSum
    }
}
