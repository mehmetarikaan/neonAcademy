//
//  ViewController.swift
//  Extension
//
//  Created by Mehmet Arıkan on 3.02.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       //MARK: - The developers set out on their journey, determined to rise to the challenge. They began by creating an extension for String that would allow the citizens to easily check if a string was a palindrome, a word or phrase that reads the same forwards as backwards. The citizens were thrilled with this new feature and it quickly became a favorite among the kingdom's bards and poets.
        
        let word = "mehmettemhem"
        print("String Task: \(word.isPalindrome())")
        
        // MARK: - Next, the developers tackled the Int extension. They added a function that would determine if a number was prime, which made solving mathematical puzzles much easier for the kingdom's scholars. The citizens were amazed by this new tool and it quickly became a staple in the kingdom's schools.
        let numberPrime = 7
        print("Int Task: \(numberPrime.prime(number: numberPrime))")
        
        //MARK: - The Bool extension was not left behind, they added a function that could easily invert a boolean value, allowing the citizens to quickly switch between true and false, making their lives more efficient.
        
        var mehmet = true
        print("Bool Task: \(mehmet.reverse())")
        
        //MARK: - The developers continued on their journey, creating an extension for Date that would allow the citizens to calculate the number of days between two dates, making it much easier for them to plan events and keep track of important dates.
        
        //ChatGPT
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"

        let startString = "08/05/1999"
        let endString = "12/06/1999"

        guard let start = formatter.date(from: startString), let end = formatter.date(from: endString) else {
            print("Couldn't parse dates")
            return
        }

        let days = Date.daysBetween(start: start, end: end)
        print(days)
        
        //MARK: - For UIViewController, UILabel, UIImage, UIImageView and UIButton, They added a function to easily change the background color, text, and image respectively, making it much more convenient for the kingdom's designers and developers to create beautiful and engaging user interfaces.
        
        //MARK: - UIViewController

        let backColor = UIViewController()
        backColor.changeBackgroundColor(color: .blue)
        
        //MARK: - UILabel
        
        let label = UILabel()
        label.changeText(text: "Mehmet Arıkan")
        
        //MARK: - UIImage
        
        // crash
        
        //MARK: - UIImageView
        
        let imageView = UIImageView()
        imageView.changeImageView(image: UIImage(named: "Mehmet"))
        
        //MARK: - UIButton
        let button = UIButton()
        button.changeButton(backgroundColor: .red)
        
    }
}


