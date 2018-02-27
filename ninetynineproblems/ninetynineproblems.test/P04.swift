import XCTest

//P04 (*) Find the number of elements of a linked list.

extension List {
    var length: Int {
        var lenght = 0;
        forEach { _ in
            lenght += 1
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
