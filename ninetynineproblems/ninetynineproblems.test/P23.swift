import XCTest

//P23 (**) Extract a given number of randomly selected elements from a linked list.
enum P23Error: Error {
    case IndexOutOfBound
}

extension List {
    func randomSelect(_ amount: UInt) throws -> List  {
        let length = self.length
        guard amount <= length  else {
            throw P23Error.IndexOutOfBound
        }
        var values = [T]()
        forEach { element in
            values.append(element)
        }
        
        var buffer = [T]()
        for _ in 0..<amount {
            let index = Int(arc4random_uniform(UInt32(values.count)))
            buffer.append(values.remove(at: index))
        }
        
        return List(buffer)!
    }
}

class P23Test: XCTestCase {
    func test() {
        let values = ["a", "b", "c", "d", "e", "f", "g", "h"]
        let initialList = List(values)
        let outOfBoundIndex = UInt(values.count + 1)
        XCTAssertThrowsError(try initialList?.randomSelect(outOfBoundIndex))
        
        let list = try! initialList?.randomSelect(3)
        
        XCTAssertTrue(List("a", "b", "c", "d", "e", "f", "g", "h") == initialList)
        XCTAssertEqual(3, list?.length)
        list?.forEach { element in
            XCTAssertTrue(values.contains(element))
        }
    }
}
