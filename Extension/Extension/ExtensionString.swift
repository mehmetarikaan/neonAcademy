//
//  File.swift
//  Extension
//
//  Created by Mehmet Arıkan on 3.02.2023.
//

import Foundation


extension String{
    func isPalindrome() -> Bool {
         let lowercased = self.lowercased()
         let reversed = String(lowercased.reversed())
         return lowercased == reversed
     }
}
