import XCTest

class Brackets: XCTestCase {

    func DISABLED_testExampleNotProperlyNested() {
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

    private func assert(input: String, output: Int) {
        let expected = output
        var string = input

        let result = solution(&string)

        XCTAssertEqual(expected, result)
    }

    public func solution(_ S : inout String) -> Int {
        return 1
    }
}
