//
//  StringExtension.swift
//  Panagram
//
//  Created by Cody Fazio on 1/29/17.
//  Copyright © 2017 Cody Fazio. All rights reserved.
//

import Foundation

extension String {
    func isAnagramOfString(_ s: String) -> Bool {
        let lowerSelf = self.lowercased().replacingOccurrences(of: " ", with: "")
        let lowerOther = s.lowercased().replacingOccurrences(of: " ", with: "")
        
        return lowerSelf.characters.sorted() == lowerOther.characters.sorted()
    }
    
    func isPalindrome() -> Bool {
        let f = self.lowercased().replacingOccurrences(of: " ", with: "")
        let s = String(f.characters.reversed())
        
        return f == s
    }
}
