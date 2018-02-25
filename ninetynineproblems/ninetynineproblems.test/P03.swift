import XCTest

//P03 (*) Find the Kth element of a linked list.

extension List {
    subscript(index: Int) -> T? {
        var counter = 0
        var list = self
        while counter < index {
            counter += 1
            if list.next == nil {
                return nil
            }
            list = list.next!
        }
        return list.value
    }
}

class P03Test: XCTestCase {
    func test() {
        XCTAssertEqual(2, List(1, 1, 2, 3, 5, 8)![2])
        XCTAssertEqual(1, List(1, 1, 2, 3, 5, 8)![0])
        XCTAssertEqual(8, List(1, 1, 2, 3, 5, 8)![5])
        XCTAssertNil(List(1)![1])
    }
}

