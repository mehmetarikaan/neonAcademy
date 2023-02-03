//
//  ExtensionDate.swift
//  Extension
//
//  Created by Mehmet Arıkan on 3.02.2023.
//

import Foundation

//ChatGPT

extension Date {
    static func daysBetween(start: Date, end: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: start, to: end)
        return components.day ?? 0
    }
}
