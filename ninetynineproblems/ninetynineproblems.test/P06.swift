import XCTest

//P06 (*) Find out whether a linked list is a palindrome.
extension List where T: Equatable{
    func isPalindrome() -> Bool {
        let middleIndex = length / 2
        for index in 0..<middleIndex {
            if self[index] != self[length - index - 1] {
                return false
            }
        }
        return true
    }
}

class P06Test: XCTestCase {
    func test() {
        XCTAssertTrue(List(1)!.isPalindrome())
        XCTAssertTrue(List(1, 2, 2, 1)!.isPalindrome())
        XCTAssertTrue(List(1, 2, 3, 2, 1)!.isPalindrome())
        XCTAssertFalse(List(1, 3, 2, 1)!.isPalindrome())
    }
}
