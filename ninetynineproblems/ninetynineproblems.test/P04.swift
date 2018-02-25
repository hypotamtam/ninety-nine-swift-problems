import XCTest

//P04 (*) Find the number of elements of a linked list.

extension List {
    var length: Int {
        var lenght = 1;
        var list = self
        while list.next != nil {
            lenght += 1
            list = list.next!
        }
        return lenght
    }
}

class P04Test: XCTestCase {
    func test() {
        XCTAssertEqual(2, List(1, 2)?.length)
        XCTAssertEqual(1, List(1)?.length)
    }
}
