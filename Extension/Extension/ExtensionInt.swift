//
//  ExtensionInt.swift
//  Extension
//
//  Created by Mehmet Arıkan on 3.02.2023.
//

import Foundation

extension Int{
    func prime(number: Int) -> Bool{
        return number > 1 && !(2..<number).contains { number % $0 == 0 }
    }
}
