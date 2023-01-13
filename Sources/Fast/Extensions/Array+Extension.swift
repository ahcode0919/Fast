//
//  Array+Extension.swift
//  
//
//  Created by Aaron Hinton on 1/11/23.
//

import Foundation

public extension Array where Element == Double {
    static func random(range: Range<Double>, size: Int) -> [Double] {
        var arr = [Double]()
        arr.reserveCapacity(size)
        
        for _ in 0..<size {
            arr.append(Double.random(in: range))
        }
        return arr
    }
}

public extension Array where Element == Float {
    static func random(range: Range<Float>, size: Int) -> [Float] {
        var arr = [Float]()
        arr.reserveCapacity(size)
        
        for _ in 0..<size {
            arr.append(Float.random(in: range))
        }
        return arr
    }
}

public extension Array where Element == Int {
    static func random(range: Range<Int>, size: Int) -> [Int] {
        var arr = [Int]()
        arr.reserveCapacity(size)
        
        for _ in 0..<size {
            arr.append(Int.random(in: range))
        }
        return arr
    }
}

public extension Array where Element == UInt {
    static func random(range: Range<UInt>, size: Int) -> [UInt] {
        var arr = [UInt]()
        arr.reserveCapacity(size)
        
        for _ in 0..<size {
            arr.append(UInt.random(in: range))
        }
        return arr
    }
}
