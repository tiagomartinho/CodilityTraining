import XCTest

class MinAvgTwoSliceTest: XCTestCase {

    func testExample() {
        let expected = 1
        var A = [4, 2, 2, 5, 1, 5, 8]
        
        let result = solution(&A)
        
        XCTAssertEqual(expected, result)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        var minimumAverage = Double(A[0] + A[1]) / 2.0
        var minimumPosition = 0
        
        for index in 0..<A.count-2 {
            let twoElementAverage = Double(A[index] + A[index + 1]) / 2.0
            if twoElementAverage < minimumAverage {
                minimumAverage = twoElementAverage
                minimumPosition = index
            }
            
            let threeElementAverage = Double(A[index] + A[index + 1] + A[index + 2]) / 3.0
            if threeElementAverage < minimumAverage {
                minimumAverage = threeElementAverage
                minimumPosition = index
            }
        }
        
        let lastTwoElementAverage = Double(A[A.count - 2] + A[A.count - 1]) / 2.0
        if lastTwoElementAverage < minimumAverage {
            minimumAverage = lastTwoElementAverage
            minimumPosition = A.count - 2
        }
        
        return minimumPosition
    }
}
