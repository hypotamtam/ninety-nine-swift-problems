import XCTest

//P24 (*) Lotto: Draw N different random numbers from the set 1..M.
//Return a linked list with the lotto numbers.
extension List {
    class func lotto(_ numbers: UInt, _ maximum: UInt) -> List<Int> {
        let maximumUint32 = UInt32(maximum)
        var list = List<Int>(lotoNumber(maximumUint32), nil)
        let ret = list
        for _ in 1..<numbers {
            list.next = List<Int>(lotoNumber(maximumUint32), nil)
            list = list.next!
        }
        
        return ret
    }
    
    class func lotoNumber(_ maximum: UInt32) -> Int {
        return Int(arc4random_uniform(maximum - 1)) + 1
    }
}

class P24Test : XCTestCase {

    func test() {
        let list = List<Int>.lotto(6, 49)
        XCTAssertEqual(6, list.length)
        list.forEach { element in
            XCTAssertTrue((element <= 49) && (element > 0))
        }
    }
}


