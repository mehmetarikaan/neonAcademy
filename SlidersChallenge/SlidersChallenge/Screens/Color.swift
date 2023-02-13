//
//  Color.swift
//  SlidersChallenge
//
//  Created by Mehmet Arıkan on 13.02.2023.
//

import UIKit

class Colo/Users/mehmetarikan/Desktop/NeonApps/SlidersChallenge/SlidersChallenge/Screens/Color.swiftr {
    private var green: CGFloat
    private var red: CGFloat
    private var blue: CGFloat
    init(green: CGFloat, red: CGFloat, blue: CGFloat) {
        self.green = green
        self.red = red
        self.blue = blue
    }
    
    func setGreen(green: Float) {
        self.green = CGFloat(green)
    }
    func setRed(red: Float) {
        self.red = CGFloat(red)
    }
    func getString() -> String {
        let string = "Green: \(round(green))\nRed: \(red)"
        return string
    }
    func getColor() -> UIColor {
        let color = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
        return color
    }
}
