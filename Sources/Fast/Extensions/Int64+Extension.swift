//
//  Int64+Extension.swift
//  
//
//  Created by Aaron Hinton on 1/14/23.
//

import Foundation

public extension Int64 {
    
    /// Prints Int64 as a formatted Byte measurement
    /// - Parameters:
    ///   - units: Byte unit; MB, Kb, GB, etc
    ///   - countStyle: Count style, defaults to file
    /// - Returns: Formatted byte string Ex: 
    func byteFormattedString(
        units: ByteCountFormatter.Units? = nil,
        countStyle: ByteCountFormatter.CountStyle = .file
    ) -> String {
        let formatter = ByteCountFormatter()
        formatter.allowsNonnumericFormatting = false
        formatter.countStyle = .file

        if let units = units {
            formatter.allowedUnits = units
        }
        
        return formatter.string(fromByteCount: self)
    }
}
