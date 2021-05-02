//
//  String+Extension.swift
//  
//
//  Created by Aaron Hinton on 4/30/21.
//

import Foundation

public extension String {
    public func chomp() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
