import XCTest

//P15 (**) Duplicate the elements of a linked list a given number of times.
extension List {
    func duplicate(_ times: Int) -> List {
        var buffer = [T]()
        self.forEach { element in
            buffer.append(contentsOf: [T](repeating: element, count: times))
        }
        return List(buffer)!
    }
}

class P15Test: XCTestCase {
    
    func test() {
        let list = List("a", "b", "c", "c", "d")!.duplicate(3)
        let expectedList = List("a", "a", "a", "b", "b", "b", "c", "c", "c", "c", "c", "c", "d", "d", "d")!
        XCTAssertTrue(expectedList == list)
    }
    
}
