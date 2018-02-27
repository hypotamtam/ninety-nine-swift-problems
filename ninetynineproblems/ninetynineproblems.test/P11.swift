import XCTest

//P11 (*) Modified run-length encoding.
//Modify the result of problem P10 in such a way that if an element has no duplicates it is simply copied into the result linked list.
//Only elements with duplicates are transferred as (N, E) terms.
extension List where T: Equatable {
    func encodeModified() -> List<Any> {
        var buffer = [Any]()
        self.encode().forEach { element in
            print(element)
            if (element.0 == 1) {
                buffer.append(element.1)
            } else {
                buffer.append((element.0, element.1))
            }
        }
        return List<Any>(buffer)!
    }
}

class P11Test: XCTestCase {
    
    func test() {
        let expectedList: List<Any> = List((4, "a"), "b", (2, "c"), (2, "a"), "d", (4, "e"))!
        let list = List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")!.encodeModified()
        
        XCTAssertEqual(expectedList.length, list.length)
        for index in 0..<expectedList.length {
            let testedValue: Any? = list[index]
            let exceptedValue = expectedList[index]
            if let value = testedValue as? (Int, String), let epxectedValue = exceptedValue as? (Int, String) {
                XCTAssertTrue(epxectedValue == value)
            } else if let value = testedValue as? String, let epxectedValue = exceptedValue as? String {
                XCTAssertEqual(epxectedValue, value)
            } else {
                XCTFail()
            }
        }
    }
}
