import XCTest

class Peaks: XCTestCase {

    func testExample() {
        let content = readStringFromFile()
        let numbers = stringToArrayOfNumbers(content)
        let expected = 3
        var A = numbers

        let result = solution(&A)

        XCTAssertEqual(expected, result)
    }

    public func solution(_ A : inout [Int]) -> Int {
        let peaks = findPeaks(A)
        var flags = 0
        var lastFlag: Int?
        for peak in peaks {
            if let flag = lastFlag {
                if flag + peaks.count <= peak {
                    lastFlag = peak
                    flags += 1
                }
            } else {
                lastFlag = peak
                flags += 1
            }
        }
        return flags
    }

    func findPeaks(_ A: [Int]) -> [Int] {
        var peaks = [Int]()
        for (index,value) in A.enumerated() {
            if index != 0 && index != A.count - 1 {
                if value > A[index - 1] && value > A[index + 1] {
                    peaks.append(index)
                }
            }
        }
        return peaks
    }

    func testFindPeaks() {
        let expected = [1]
        let A = [0, 1, 0]

        let result = findPeaks(A)

        XCTAssertEqual(expected, result)
    }

    func testFindPeaks2() {
        let expected = [1,3,5,10]
        let A = [1, 5, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2]

        let result = findPeaks(A)

        XCTAssertEqual(expected, result)
    }

    func readStringFromFile() -> String {
        let fileName = "InputData"
        let bundle = Bundle(for: Peaks.self)
        if let path = bundle.path(forResource: fileName, ofType: "txt") {
            do {
                return try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            } catch {
                return ""
            }
        }
        return ""
    }

    func stringToArrayOfNumbers(_ input: String) -> [Int] {
        let components = input.components(separatedBy: "\n")
        return components.flatMap { return Int($0) }
    }
}



