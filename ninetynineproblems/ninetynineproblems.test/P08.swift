import XCTest

//P08 (**) Eliminate consecutive duplicates of linked list elements.
//If a linked list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

extension List where T: Equatable {
    func compress() {
        var list = self
        var currentList = self
        while list.next != nil {
            if (list.value == currentList.value) {
                currentList.next = list.next
            } else {
                currentList = list
            }
            list = list.next!
        }
        if (list.value == currentList.value) {
            currentList.next = list.next
        }
    }
}


class P08Test: XCTestCase {
    
    func test() {
        let list = List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")!
        list.compress()
        XCTAssertTrue(List("a", "b", "c", "a", "d", "e") == list)
    }
}
