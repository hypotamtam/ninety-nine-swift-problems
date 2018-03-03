import XCTest

//P21 (*) Insert an element at a given position into a linked list.
enum P21Error: Error {
    case IndexOutOfBound
}
extension List {
    func insert(_ value: T, at index: Int) throws {
        guard index >= 0 && length > index else {
            throw P21Error.IndexOutOfBound
        }
        
        if index == 0 {
            let savedValue = self.value
            self.value = value
            self.next = List(savedValue, self.next)
            return
        }
        
        var list = self
        for _ in 1..<index {
            list = list.next!
        }
        list.next = List(value, list.next)
    }
}

class P21Test: XCTestCase {
    func test() {
        let list = List("a", "b", "c", "d")
        XCTAssertThrowsError(try list?.insert("", at: -1))
        XCTAssertThrowsError(try list?.insert("", at: 4))
        
        try! list?.insert("new", at:1)
        XCTAssertTrue(List("a", "new", "b", "c", "d") == list)
        try! list?.insert("new", at:0)
        XCTAssertTrue(List("new", "a", "new", "b", "c", "d") == list)
    }
}
