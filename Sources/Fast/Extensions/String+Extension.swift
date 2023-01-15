//
//  String+Extension.swift
//  
//
//  Created by Aaron Hinton on 4/30/21.
//

import Foundation

public extension String {
    private static func getNumericScanner(_ string: String) -> Scanner {
        let scanner = Scanner(string: string)
        scanner.charactersToBeSkipped = CharacterSet.decimalDigits.inverted
        return scanner
    }

    /// Create a random string of characters [a-zA-Z0-9]
    /// - Parameter length: length of random string
    /// - Returns: random string
    static func random(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map { _ in letters.randomElement()! })
    }
    
    /// Check if string contains `CheckingType`
    /// - Parameter type: Checking type; link, address, phone number, etc
    /// - Returns: True if match found
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
    
    /// Extract doubles from the string
    /// Ex: "Test1 45.456KG" -> "[1, 456.456]"
    /// - Returns: Array of found double values
    @available(macOS 10.15, *)
    func extractDoubles() -> [Double] {
        var result: [Double] = []
        let scanner = Self.getNumericScanner(self)

        while scanner.isAtEnd == false {
            if let double = scanner.scanDouble() {
                result.append(double)
            }
        }
        return result
    }
    
    /// Extract integers from the string
    /// Ex: "Test1 456MB 34" -> "[1, 456, 34]"
    /// - Returns: Array of found integers
    @available(macOS 10.15, *)
    func extractInts() -> [Int] {
        var result: [Int] = []
        let scanner = Self.getNumericScanner(self)

        while scanner.isAtEnd == false {
            if let int = scanner.scanInt() {
                result.append(int)
            }
        }
        return result
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
