import XCTest

//P13 (**) Run-length encoding of a linked list (direct solution).
//Implement the so-called run-length encoding data compression method directly.
//I.e. don’t use other methods you’ve written (like P09’s pack); do all the work directly.

extension List where T: Equatable {
    func encodeDirect() -> List<(Int, T)> {
        var buffer = [(Int, T)]()
        
        var currentValue = self.value
        var counter = 0;
        self.forEach { value in
            if currentValue == value {
                counter += 1
            } else {
                buffer.append((counter, currentValue))
                counter = 1
                currentValue = value
            }
        }
        buffer.append((counter, currentValue))
        
        return List<(Int, T)>(buffer)!
    }
}

class P13Test: XCTestCase {
    
    func test() {
        let list = List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")!.encodeDirect()
        let expectedList = List((4, "a"), (1, "b"), (2, "c"), (2, "a"), (1, "d"), (4, "e"))!

        XCTAssertEqual(expectedList.length, list.length)
        for index in 0..<expectedList.length {
            XCTAssertTrue(expectedList[index]! == list[index]!)
        }
    }
}


