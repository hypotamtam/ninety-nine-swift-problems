import XCTest

//P22 (*) Create a linked list containing all integers within a given range.
extension List {
    class func range(_ from: Int, _ to: Int) -> List<Int> {
        let range = from...to
        return List<Int>(Array(range))!
    }
}

class P22Test: XCTestCase {
    func test() {
        XCTAssertTrue(List(4, 5, 6, 7, 8, 9) == List<Int>.range(4, 9))
        XCTAssertTrue(List(-3, -2, -1, 0, 1, 2) == List<Int>.range(-3, 2))
    }
    
}


