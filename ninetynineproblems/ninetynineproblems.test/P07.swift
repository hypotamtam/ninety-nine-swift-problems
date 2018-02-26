import XCTest

//P07 (**) Flatten a nested linked list structure.
extension List {
    func flatten() -> List {
        var buffer = [T]()
        var list: List? = self
        while list != nil {
            if let sublist = list?.value as? List {
                var flattenSublist: List? = sublist.flatten()
                while flattenSublist != nil {
                    buffer.append(flattenSublist!.value)
                    flattenSublist = flattenSublist?.next
                }
            } else {
                buffer.append(list!.value)
            }
            list = list?.next
        }
        return List(buffer)!
    }
}

class P07Test: XCTestCase {
    
    func test() {
        let flattenList = List<Any>(List<Any>(1, 1) as Any, 2, List<Any>(3, List<Any>(5, 8) as Any) as Any)!.flatten()
        let expectedList = List(1, 1, 2, 3, 5, 8)!
        for index in 0...expectedList.length {
            XCTAssertEqual(expectedList[index], flattenList[index] as? Int)
        }
    }
}
