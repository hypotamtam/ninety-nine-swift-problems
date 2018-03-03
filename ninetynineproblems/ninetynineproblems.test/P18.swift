import XCTest

//P18 (**) Extract a slice from a linked list.
//Given two indices, I and K, the slice is the linked list containing the elements from and including the Ith element up to
//but not including the Kth element of the original linked list. Start counting the elements with 0.
enum P18Error: Error {
    case IndexOutOfBound
}

extension List {
    func slice(_ from: Int, _ to: Int) throws -> List {
        guard (from < to) && (from >= 0) && (to <= length) else {
            throw P18Error.IndexOutOfBound
        }
        
        var index = 0
        var buffer = [T]()
        forEach { element in
            if (index >= from) && (index < to) {
                buffer.append(element)
            }
            index += 1
        }
        
        return List(buffer)!
    }
}

class P18Test: XCTestCase {
    
    func test() {
        var list = try! List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k")!.slice(3, 7)
        XCTAssertTrue(List("d", "e", "f", "g")! == list)
        list = try! List("a", "b", "c", "d")!.slice(0, 4)
        XCTAssertTrue(List("a", "b", "c", "d")! == list)

        XCTAssertThrowsError(try List("a", "b", "c", "d")!.slice(-1, 4))
        XCTAssertThrowsError(try List("a", "b", "c", "d")?.slice(2, 5))

        
    }
    
}
