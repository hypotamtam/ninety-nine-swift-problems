import XCTest

//P09 (**) Pack consecutive duplicates of linked list elements into sub linked lists.
//If a list contains repeated elements they should be placed in separate sub linked lists.

extension List where T: Equatable {
    func pack() -> List<List<T>> {
//        var list = self
        var curentList = self
        var returnList: List<List<T>>? = nil
        var packedList: List<List<T>>? = nil
        
        var buffer = [T]()
        self.forEachList { list in
            if list.value == curentList.value {
                buffer.append(list.value)
            } else {
                if returnList == nil {
                    returnList = List<List<T>>(List(buffer)!)
                    packedList = returnList
                } else {
                    packedList?.next = List<List<T>>(List(buffer)!)
                    packedList = packedList?.next
                }
                curentList = list
                buffer.removeAll()
                buffer.append(list.value)
            }
        }
        
        packedList?.next = List<List<T>>(List(buffer)!)        
        return returnList!
        
    }
}

class P09Test: XCTestCase {
    
    func test() {
        let list = List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")!.pack()
        XCTAssertTrue(List("a", "a", "a", "a")! == list[0]!)
        XCTAssertTrue(List("b")! == list[1]!)
        XCTAssertTrue(List("c", "c")! == list[2]!)
        XCTAssertTrue(List("a", "a")! == list[3]!)
        XCTAssertTrue(List("d")! == list[4]!)
        XCTAssertTrue(List("e", "e", "e", "e")! == list[5]!)
        XCTAssertNil(list[6])
    }
}


