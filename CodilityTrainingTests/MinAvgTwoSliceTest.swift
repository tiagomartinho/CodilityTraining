import XCTest

class MinAvgTwoSliceTest: XCTestCase {

    func testExample() {
        let expected = 1
        var A = [4, 2, 2, 5, 1, 5, 8]
        
        let result = solution(&A)
        
        XCTAssertEqual(expected, result)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        return 0
    }
}
