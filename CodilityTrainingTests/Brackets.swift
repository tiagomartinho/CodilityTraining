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

    private func assert(input: String, output: Int) {
        let expected = output
        var string = input

        let result = solution(&string)

        XCTAssertEqual(expected, result)
    }

    public func solution(_ S : inout String) -> Int {
        let nestChars: [Character:Character] = ["(":")", "{":"}", "[":"]"]
        var openNest = [Character]()

        for char in S.characters {
            let containsNesting = nestChars.contains { char == $0.0 || char == $0.1 }
            if containsNesting {
                if nestChars[char] != nil {
                    openNest.append(char)
                } else {
                    if let last = openNest.last {
                        openNest.removeLast()
                        if let close = nestChars[last] {
                            if close != char {
                                return 0
                            }
                        } else {
                            return 0
                        }
                    } else {
                        return 0
                    }
                }
            }
        }
        return openNest.isEmpty ? 1 : 0
    }
}
