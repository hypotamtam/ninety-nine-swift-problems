import XCTest

//P10 (*) Run-length encoding of a linked list.
//Use the result of problem P09 to implement the so-called run-length encoding data compression method.
//Consecutive duplicates of elements are encoded as tuples (N, E) where N is the number of duplicates of the element E.
extension List where T: Equatable {
    func encode() -> List<(Int, T)> {
        var buffer = [(Int, T)]()
        self.pack().forEach { element in
            buffer.append((element.length, element.value))
        }
    
        return List<(Int, T)>(buffer)!
    }
}

class P10Test: XCTestCase {
    func test() {
        let list = List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")!.encode()
        let expectedList = List((4, "a"), (1, "b"), (2, "c"), (2, "a"), (1, "d"), (4, "e"))!
        
        XCTAssertEqual(expectedList.length, list.length)
        for index in 0..<expectedList.length {
            XCTAssertTrue(expectedList[index]! == list[index]!)
        }
    }
}

func == <T:Equatable> (lhs:(T,T), rhs:(T,T)) -> Bool{
    return (lhs.0 == rhs.0) && (lhs.1 == rhs.1)
}
