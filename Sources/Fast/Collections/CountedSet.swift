//
//  CountedSet.swift
//  
//
//  Created by Aaron Hinton on 1/15/23.
//

import Foundation

public struct CountedSet<T>: Equatable {
    let _set: NSCountedSet
    
    public var count: Int {
        return _set.count
    }
    
    public var isEmpty: Bool {
        return _set.count == 0
    }
    
    public init() {
        self._set = NSCountedSet()
    }
    
    public init(capacity: Int) {
        self._set = NSCountedSet(capacity: capacity)
    }
    
    public init(set: Set<AnyHashable>) {
        self._set = NSCountedSet(set: set)
    }
    
    public init(values: [T]) {
        self._set = NSCountedSet(array: values)
    }

    public func add(_ value: T) {
        self._set.add(value)
    }
    
    public func contains(_ value: T) -> Bool {
        self._set.contains(value)
    }
    
    public func count(for value: T) -> Int {
        self._set.count(for: value)
    }
    
    public func makeIterator() -> NSFastEnumerationIterator {
        self._set.makeIterator()
    }

    public func remove(_ value: T) {
        self._set.remove(value)        
    }
    
    public func values() -> [T] {
        var iterator = makeIterator()
        var values = [T]()
        
        while let value = iterator.next() as? T {
            values.append(value)
        }
        return values
    }
    
    /// Returns an array of the values in the set, occurances match the count in the set
    /// Ex: Counted set with [1]  and a count of 3 will return [1, 1, 1]
    /// - Note: Order of insertion is not preserved
    /// - Returns: Array of values
    public func valuesByCount() -> [T] {
        var iterator = makeIterator()
        var values = [T]()
        
        while let value = iterator.next() as? T {
            let count = count(for: value)
            for _ in 0..<count {
                values.append(value)
            }
        }
        return values
    }
}
