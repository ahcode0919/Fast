//
//  TypedEnumerator.swift
//  
//
//  Created by Aaron Hinton on 1/15/23.
//

import Foundation

class TypedEnumerator<T>: NSEnumerator {
    private var _enumerator: NSEnumerator
    
    init(_ enumerator: NSEnumerator) {
        self._enumerator = enumerator
    }
    
    
}
