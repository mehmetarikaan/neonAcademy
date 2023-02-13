//
//  ExtensionUnderline.swift
//  TextFields
//
//  Created by Mehmet Arıkan on 13.02.2023.
//

import Foundation
import UIKit

extension UITextField {
    func underline() {
        if let textString = self.text {
          let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: attributedString.length))
          attributedText = attributedString
        }
    }
}
