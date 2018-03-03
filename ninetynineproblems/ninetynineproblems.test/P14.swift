import XCTest

//P14 (*) Duplicate the elements of a linked list.
extension List {
    func duplicate() -> List {
        var buffer = [T]()
        self.forEach { element in
            buffer.append(element)
            buffer.append(element)
        }
        return List(buffer)!
    }
}


class P14Test: XCTestCase {
    
    func test() {
        let list = List("a", "b", "c", "c", "d")!.duplicate()
        let expectedList = List("a", "a", "b", "b", "c", "c", "c", "c", "d", "d")
        XCTAssertTrue(expectedList == list)

    }
}

