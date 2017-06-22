import XCTest

class Nesting: XCTestCase {

    func testEmptyStringIsProperlyNested() {
        assert(input: "", output: 1)
    }

    func testExampleProperlyNested() {
        assert(input: "(U)", output: 1)
    }

    func testExampleCharactersProperlyNested() {
        assert(input: "VW", output: 1)
    }

    func testExampleParenthesesProperlyNested() {
        assert(input: "(()(())())", output: 1)
    }

    func testExampleParenthesesNotProperlyNested() {
        assert(input: "())", output: 0)
    }

    private func assert(input: String, output: Int) {
        let expected = output
        var string = input

        let result = solution(&string)

        XCTAssertEqual(expected, result)
    }

    public func solution(_ S : inout String) -> Int {
        let nestChars: [Character:Character] = ["(":")"]
        var current = 0
        var openNest = [Character](repeating: " ", count: S.characters.count)
        for char in S.characters {
            switch char {
            case ")":
                if current <= 0 { return 0 }
                current -= 1
                let last = openNest[current]
                guard let close = nestChars[last] else { return 0 }
                if close != char { return 0 }
            case "(":
                openNest[current] = char
                current += 1
            default:
                continue
            }
        }
        return current == 0 ? 1 : 0
    }
}

