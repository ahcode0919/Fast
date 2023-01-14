//
//  String+Extension.swift
//  
//
//  Created by Aaron Hinton on 4/30/21.
//

import Foundation

public extension String {
    static func random(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map { _ in letters.randomElement()! })
    }

    func contains(_ type: NSTextCheckingResult.CheckingType) -> Bool {
        let range = NSRange(0..<self.count)
        let types: NSTextCheckingResult.CheckingType = [type]
        guard let dataDetector = try? NSDataDetector(types: types.rawValue),
              let match = dataDetector.firstMatch(in: self, options: [], range: range),
              match.resultType == type else {
            return false
        }
        return true
    }
    
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
