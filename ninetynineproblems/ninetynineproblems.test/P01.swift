import XCTest

//P01 (*) Find the last element of a linked list.
extension List {
    var last: T? {
        var list = self;
        while list.next != nil {
            list = list.next!
        }
        return list.value
    }
}

class P01Test: XCTestCase {

    func test() {
        XCTAssertEqual(8, List(1, 1, 2, 3, 5, 8)!.last)
        XCTAssertEqual(2, List(1, 2)!.last)
        XCTAssertNil(List<Int>()?.last)
    }
}
