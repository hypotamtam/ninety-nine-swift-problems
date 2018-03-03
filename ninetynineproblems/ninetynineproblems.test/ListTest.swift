import XCTest

class ListTest: XCTestCase {

    func testInitWithVariadicParam() {
        let list = List(1, 2, 3)!
        XCTAssertTrue(list.value == 1)
        XCTAssertTrue(list.next?.value == 2)
        XCTAssertTrue(list.next?.next?.value == 3)
        XCTAssertNil(list.next?.next?.next)
        XCTAssertNil(List<Int>())
    }
    
    func testEqualOp() {
        XCTAssertTrue(List(1, 2, 3)! == List(1, 2, 3)!)
        XCTAssertFalse(List(1, 2, 3)! == List(1, 2)!)
        XCTAssertTrue(List(1, 2, 3) == List(1, 2, 3))
        XCTAssertFalse(List(1, 2, 3) == List(1, 2))

    }
    
}
