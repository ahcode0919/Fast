//
//  OrderedSet.swift
//  
//
//  Created by Aaron Hinton on 1/7/23.
//

import Foundation

public struct OrderedSet<T: Hashable>: Sequence, Equatable {
    private let _set = NSMutableOrderedSet()
    
    public var count: Int {
        _set.count
    }
    
    public var isEmpty: Bool {
        _set.count == 0
    }
    
    public init() {}
    
    public init(_ values: [T]) {
        self.init()
        for value in values {
            self.add(value)
        }
    }
    
    public func add(_ element: T) {
        _set.add(element)
    }
    
    public func contains(_ element: T) -> Bool {
        _set.contains(element)
    }
    
    public func makeIterator() -> NSFastEnumerationIterator {
        _set.makeIterator()
    }
    
    public func remove(_ element: T) {
        _set.remove(element)
    }
    
    public func values() -> [T] {
        var values: [T] = []
        var iterator = makeIterator()

        while let value = iterator.next() as? T {
            values.append(value)
        }
        return values
    }
}
