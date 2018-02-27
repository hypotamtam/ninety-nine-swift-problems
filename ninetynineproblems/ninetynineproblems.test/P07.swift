import XCTest

//P07 (**) Flatten a nested linked list structure.
extension List {
    func flatten() -> List {
        var buffer = [T]()
        self.forEach { element in
            if let sublist = element as? List {
                sublist.flatten().forEach({ sublistElement in
                    buffer.append(sublistElement)
                })
            } else {
                buffer.append(element)
            }
        }
        
        return List(buffer)!
    }
}

class P07Test: XCTestCase {
    
    func test() {
        let flattenList = List<Any>(List<Any>(1, 1) as Any, 2, List<Any>(3, List<Any>(5, 8) as Any) as Any, 3)!.flatten()
        let expectedList = List(1, 1, 2, 3, 5, 8, 3)!
        for index in 0...expectedList.length {
            XCTAssertEqual(expectedList[index], flattenList[index] as? Int)
        }
    }
}
