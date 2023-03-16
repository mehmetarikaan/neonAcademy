//
//  FormModel.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 16.03.2023.
//


// FIXME: - FormIs dont working
import Foundation

protocol FormControllerProtocol {
    func checkFormStatus()
}

struct FormModel {
    var babyFullName: String?
    var birthDate: String?
    var timeOfBirth: String?
    var dueDate: String?
    
    var formIsValid = true
//    var formIsValid: Bool {
//        if babyFullName?.isEmpty && birthDate?.isEmpty && timeOfBirth?.isEmpty && dueDate?.isEmpty {
//            return false
//        } else {
//            return true
//        }
//    }
}
