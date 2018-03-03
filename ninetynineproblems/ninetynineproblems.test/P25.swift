import XCTest

//P25 (*) Generate a random permutation of the elements of a linked list.
extension List {
    func randomPermute() -> List {
        return try! self.randomSelect(UInt(self.length))
    }
}


class P25Test: XCTestCase {
    func test() {
        let values = ["a", "b", "c", "d", "e", "f"]
        let list = List(values)!.randomPermute()
        XCTAssertEqual(values.count, list.length)
        var valuesSet = Set<String>()
        list.forEach { element in
            valuesSet.insert(element)
            XCTAssertTrue(values.contains(element))
        }
        XCTAssertEqual(values.count, valuesSet.capacity)
    }
}
