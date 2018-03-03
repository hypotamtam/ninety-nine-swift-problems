import XCTest

//P12 (**) Decode a run-length encoded linked list.
//Given a run-length code linked list generated as specified in problem P10, construct its uncompressed version.
extension List {
    func decode<U>() throws -> List<U> where T == (Int, U) {
        var buffer = [U]()
        self.forEach { element in
            buffer.append(contentsOf:[U](repeating: element.1, count: element.0))
        }
        return List<U>(buffer)!
    }
}

class P12Test: XCTestCase {
    func test() {
        let list = try! List((4, "a"), (1, "b"), (2, "c"), (2, "a"), (1, "d"), (4, "e"))!.decode()
        XCTAssertTrue(List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e") == list)
    }
}



