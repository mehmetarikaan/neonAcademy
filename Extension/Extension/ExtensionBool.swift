//
//  ExtensionBool.swift
//  Extension
//
//  Created by Mehmet Arıkan on 3.02.2023.
//

import Foundation


extension Bool{
    mutating func reverse () -> Bool{
        if self == true{
            self = false
            return self
        } else {
            self = true
            return self
        }
    }
}
