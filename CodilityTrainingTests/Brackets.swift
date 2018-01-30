import XCTest

class Brackets: XCTestCase {

    func testExampleNotProperlyNested() {
        assert(input: "([)()]", output: 0)
    }

    func testExampleProperlyNested() {
        assert(input: "{[()()]}", output: 1)
    }

    func testEmptyIsProperlyNested() {
        assert(input: "", output: 1)
    }

    func testOneCharIsProperlyNested() {
        assert(input: "(a)", output: 1)
        assert(input: "[B]", output: 1)
        assert(input: "{c}", output: 1)
    }

    func testMultipleCharsIsProperlyNested() {
        assert(input: "(aBc)", output: 1)
        assert(input: "[Bc]", output: 1)
        assert(input: "{ca}", output: 1)
    }

    func testNeverCloseNotProperlyNested() {
        assert(input: "({[", output: 0)
    }

    func testPerformanceExample() {
        let N = 100000
        var S = ""
        for _ in 1...N {
            S.append("(")
        }
        for _ in 1...N {
            S.append(")")
        }

        self.measure {
            let expected = 1
            let output = self.solution(&S)
            XCTAssertEqual(expected, output)
        }
    }

    private func assert(input: String, output: Int) {
        let expected = output
        var string = input

        let result = solution(&string)

        XCTAssertEqual(expected, result)
    }

    public func solution(_ S : inout String) -> Int {
        let nestChars: [Character:Character] = ["(":")", "{":"}", "[":"]"]
        var current = 0
        var openNest = [Character](repeating: " ", count: S.count)
        for char in S {
            switch char {
            case ")", "}", "]":
                if current <= 0 { return 0 }
                current -= 1
                let last = openNest[current]
                guard let close = nestChars[last] else { return 0 }
                if close != char { return 0 }
            case "(", "{", "[":
                openNest[current] = char
                current += 1
            default:
                continue
            }
        }
        return current == 0 ? 1 : 0
    }
}
