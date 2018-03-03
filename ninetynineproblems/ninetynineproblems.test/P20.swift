import XCTest

//P20 (*) Remove the Kth element from a linked list.
//Return a linked list without the removed element and the removed element in a Tuple. Elements are numbered from 0.
extension List {
    func remove(at position: Int) -> (rest: List?, removed: T?) {
        var buffer = [T]()
        forEach { element in
            buffer.append(element)
        }
        
        guard buffer.indices.contains(position) else {
            return (List(buffer), nil)
        }
        let removedValue = buffer.remove(at: position)
        return (List(buffer), removedValue)
    }
}

class P20Test: XCTestCase {
    func test() {
        let result = List("a", "b", "c", "d")!.remove(at: 1)
        XCTAssertTrue(List("a", "c", "d") == result.rest)
        XCTAssertTrue("b" == result.removed!)

        let list = List("a", "b", "c", "d")
        XCTAssertTrue(list == list?.remove(at: -1).rest)
        XCTAssertFalse(list === list?.remove(at: -1).rest)
        XCTAssertTrue(nil == list?.remove(at: -1).removed)
        XCTAssertTrue(nil == list?.remove(at: 4).removed)
    }
}
