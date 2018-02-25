import XCTest

//P05 (*) Reverse a linked list.
extension List {
    func reverse() {
        guard self.length != 1 else {
            return
        }
        
        let middleIndex = length / 2
        var list = self
        var buffer = [T]()
        for index in 0..<middleIndex {
            buffer.insert(list.value, at: 0)
            list.value = self[length - index - 1]!
            list = list.next!
        }
        if length % 2 == 1 {
            list = list.next!
        }
        
        for index in 0..<(middleIndex - 1) {
            list.value = buffer[index]
            list = list.next!
        }
        list.value = buffer.last!
    }
}

class P05Test: XCTestCase {
    func test() {
        let listOneElement = List(1)!
        listOneElement.reverse()
        XCTAssertTrue(List(1)! == listOneElement)

        let list = List(4, 3, 2, 1)!
        list.reverse()
        XCTAssertTrue(List(1, 2, 3, 4)! == list)
      
        let listOddLength = List(5, 4, 3, 2, 1)!
        listOddLength.reverse()
        XCTAssertTrue(List(1, 2, 3, 4, 5)! == listOddLength)

    }
}
