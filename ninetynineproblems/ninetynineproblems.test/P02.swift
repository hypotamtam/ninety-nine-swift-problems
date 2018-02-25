import XCTest

// P02 (*) Find the last but one element of a linked list.
extension List {
    var pennultimate: T? {
        var list = self
        while list.next?.next != nil {
            list = list.next!
        }
        guard list.next != nil else {
            return nil
        }
        return list.value
    }
}

class P02test: XCTestCase {
    
    func test() {
        XCTAssertEqual(5, List(1, 1, 2, 3, 5, 8)!.pennultimate)
        XCTAssertEqual(1, List(1, 2)?.pennultimate)
        XCTAssertNil(List(1)?.pennultimate)

    }
    
}


