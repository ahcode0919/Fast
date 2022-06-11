//
//  String+Extension.swift
//  
//
//  Created by Aaron Hinton on 4/30/21.
//

import Foundation

public extension String {
    
    /// Removes whitespace and Newlines from the beginning and ending of the String
    /// - Returns: String without whitespace at the beginning or end
    func chomp() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Adds quotes to a string, fill ignore if the string is already quoted
    /// - Returns: Quoted string "{String}"
    func withQuotes() -> String {
        if let first = self.first, let last = self.last, first == "\"", last == "\"" {
            return self
        }
        return "\"\(self)\""
    }
}
