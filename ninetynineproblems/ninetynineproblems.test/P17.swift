import XCTest

//P17 (*) Split a linked list into two parts.
//The length of the first part is given. Use a Tuple for your result.
enum P17Error: Error {
    case IndexOutOfBound
}

extension List {
    func split(at index: Int) throws -> (left: List, right: List) {
        guard index > 0 && length > index else {
            throw P17Error.IndexOutOfBound
        }
        
        var internalIndex = 0
        var bufferRight = [T]()
        var bufferLeft = [T]()
        forEach { element in
            if (internalIndex < index) {
                bufferLeft.append(element)
            } else {
                bufferRight.append(element)
            }
            internalIndex += 1
        }
        
        return (left: List(bufferLeft)!, right: List(bufferRight)!)
    }
}
class P17Test: XCTestCase {
    func test() {
        let lists = try! List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k")!.split(at: 3)
        XCTAssertTrue(List("a", "b", "c")! == lists.left)
        XCTAssertTrue(List("d", "e", "f", "g", "h", "i", "j", "k")! == lists.right)
        
        XCTAssertThrowsError(try List("a", "b", "c")?.split(at: 0))
        XCTAssertThrowsError(try List("a", "b", "c")?.split(at: 3))
    }
}
