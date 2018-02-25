
let array = [1, 2, 3]
array.suffix(from: 1)

class List<T> {
    var value: T
    var next: List<T>?

    init(_ value: T, next elements: List<T>?) {
        self.value = value;
        next = elements
    }

    convenience init?(_ elements: T...) {
        self.init(elements)
    }

    init?(_ elements: [T]) {
        guard !elements.isEmpty else {
            return nil
        }
        value = elements[0]
        next = List(Array(elements.suffix(from: 1)))
    }
}

//: P01 (*) Find the last element of a linked list.

 extension List {
    var last: T? {
        var list = self;
        while list.next != nil {
            list = list.next!
        }
        return list.value
    }
}
assert(List(1, 1, 2, 3, 5, 8)!.last == 8)

//:P02 (*) Find the last but one element of a linked list.
extension List {
    var pennultimate: T? {
        var list = self
        while list.next?.next != nil {
            list = list.next!
        }
        guard list.next != nil else {
            return nil
        }
        return list.value
    }
}

assert(List(1, 1, 2, 3, 5, 8)!.pennultimate == 5)
assert(List(1, 2)?.pennultimate == 1)
assert(List(1)?.pennultimate == nil)

//:P03 (*) Find the Kth element of a linked list.
extension List {
    subscript(index: Int) -> T? {
        var counter = 0
        var list = self
        while counter < index {
            counter += 1
            print(list.value)
            if list.next == nil {
                return nil
            }
            list = list.next!
        }
        return list.value
    }
}

assert(List(1, 1, 2, 3, 5, 8)![2] == 2)

