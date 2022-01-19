//
//  String+Index.swift
//  WordleDebug
//
//  Created by Vasily Martin for the Developer Academy
//

import Foundation

extension String {
    // returns character in string using a given index
    subscript(_ index: Int) -> String? {
        guard index < self.count else { return nil }
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}
