import XCTest

//P19 (**) Rotate a list N places to the left.
extension List {
    func rotate(_ amount: Int) -> List {
        let listLength = length
        var pivot = amount % listLength
        if pivot < 0 {
            pivot += listLength
        }
        
        let listSplit = try! split(at: pivot)
        var lastRight = listSplit.right
        listSplit.right.forEachList { lastRight = $0 }
        lastRight.next = listSplit.left
        return listSplit.right
    }
}

class P19Test: XCTestCase {
    func test() {
        var list = List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k")!.rotate(3)
        XCTAssertTrue(List("d", "e", "f", "g", "h", "i", "j", "k", "a", "b", "c")! == list)
        
        list = List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k")!.rotate(-2)
        XCTAssertTrue(List("j", "k", "a", "b", "c", "d", "e", "f", "g", "h", "i")! == list)
    }
}


