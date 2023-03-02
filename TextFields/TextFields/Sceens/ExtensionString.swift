//
//  ExtensionString.swift
//  TextFields
//
//  Created by Mehmet Arıkan on 2.03.2023.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}").evaluate(with: self)
    }
}


