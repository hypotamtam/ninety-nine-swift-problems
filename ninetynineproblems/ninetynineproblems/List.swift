import Foundation

class List<T> {
    var value: T
    var next: List<T>?
    
    init(_ value: T, _ elements: List<T>? = nil) {
        self.value = value;
        next = elements
    }
    
    convenience init?(_ elements: T...) {
        self.init(elements)
    }
    
    convenience init?(_ elements: [T]) {
        guard !elements.isEmpty else {
            return nil
        }
        self.init(elements[0], List(Array(elements.suffix(from: 1))))
    }
}

extension List where T: Equatable {
    static func == (lhs: List<T>, rhs: List<T>) -> Bool {
        var leftList = lhs
        var rightList = rhs
        while leftList.next != nil && rightList.next != nil {
            if leftList.value != rightList.value {
                return false
            }
            leftList = leftList.next!
            rightList = rightList.next!
        }
        return leftList.value == rightList.value && leftList.next == nil && rightList.next == nil
    }
}
