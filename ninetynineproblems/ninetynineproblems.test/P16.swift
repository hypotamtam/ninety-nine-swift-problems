import XCTest

//P16 (**) Drop every Nth element from a linked list.
extension List {
    func drop(_ every: Int) -> List {
        var index = 1;
        var buffer = [T]()
        forEach { element in
            if (index == every) {
                index = 0
            } else {
                buffer.append(element)
            }
            index += 1
        }
        return List(buffer)!
    }
}

class P16Test: XCTestCase {
    func test() {
        let list = List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k")!.drop(3)
        XCTAssertTrue(List("a", "b", "d", "e", "g", "h", "j", "k") == list)
    }
}


