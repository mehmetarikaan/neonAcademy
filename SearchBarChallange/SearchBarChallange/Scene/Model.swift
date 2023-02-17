//
//  Model.swift
//  SearchBarChallange
//
//  Created by Mehmet Arıkan on 17.02.2023.
//

import Foundation

struct NeonAcademyMember {
    var fullName: String
    var title: String
    var horoscope: String
    var memberLevel: String
    var homeTown: String
    var age: Int
    var contactInformation: ContactInformation
    var team: String
    var motivationLevel: Int?
}

class ContactInformation {
    var phoneNumber: Int
    var email: String
    
    init(phoneNumber: Int, email: String) {
        self.phoneNumber = phoneNumber
        self.email = email
    }
}
