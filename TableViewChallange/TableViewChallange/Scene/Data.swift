//
//  Data.swift
//  TableViewChallange
//
//  Created by Mehmet Arıkan on 17.02.2023.
//

import UIKit

var teamMember = [
    NeonAcademyMember(fullName: "Mehmet Arıkan", title: "iOS Developer", horoscope: "Boğa", memberLevel: "A1", homeTown: "Malatya", age: 23, contactInformation: ContactInformation(phoneNumber: 5070554436, email: "mehmet@neonapps.co"), team: "iOS Development Team"),
    NeonAcademyMember(fullName: "Oğuzhan Akın", title: "iOS Developer", horoscope: "İkizler", memberLevel: "A1", homeTown: "Ordu", age: 26, contactInformation: ContactInformation(phoneNumber: 5318610629, email: "oguzhan@neonapps.co"), team: "iOS Development Team"),
    NeonAcademyMember(fullName: "Ali Beyaz", title: "iOS Developer", horoscope: "İkizler", memberLevel: "A1", homeTown: "Ordu", age: 27, contactInformation: ContactInformation(phoneNumber: 5322583505, email: "ali@neonapps.co"), team: "iOS Development Team"),
    NeonAcademyMember(fullName: "Anıl Sezer", title: "iOS Developer", horoscope: "Yengeç", memberLevel: "A1", homeTown: "Giresun", age: 24, contactInformation: ContactInformation(phoneNumber: 5362929275, email: "anil@neonapps.co"), team: "iOS Development Team"),
    NeonAcademyMember(fullName: "Seyhun Koçak", title: "iOS Developer", horoscope: "İkizler", memberLevel: "A1", homeTown: "Manisa", age: 27, contactInformation: ContactInformation(phoneNumber: 5056695330, email: "seyhun@neonapps.co"), team: "iOS Development Team"),
    NeonAcademyMember(fullName: "Eymen Varilci", title: "iOS Developer", horoscope: "Balık", memberLevel: "A1", homeTown: "Ordu", age: 26, contactInformation: ContactInformation(phoneNumber: 5344098326, email: "eymen@neonapps.co"), team: "iOS Development Team"),
    NeonAcademyMember(fullName: "Oğuzhan Satılmış", title: "Android Developer", horoscope: "İkizler", memberLevel: "A1", homeTown: "Tekirdağ", age: 25, contactInformation: ContactInformation(phoneNumber: 5426791619, email: "oguzhansatilmis@neonapps.co"), team: "Android Development Team"),
    NeonAcademyMember(fullName: "Atilla Eren", title: "Android Developer", horoscope: "Aslan", memberLevel: "A1", homeTown: "Malatya", age: 28, contactInformation: ContactInformation(phoneNumber: 5459707600, email: "atilla@neonapps.co"), team: "Android Development Team"),
    NeonAcademyMember(fullName: "Nesrin Bozan", title: "iOS Developer", horoscope: "Oğlak", memberLevel: "A1", homeTown: "Adıyaman", age: 24, contactInformation: ContactInformation(phoneNumber: 5462093402, email: "nesrin@neonapps.co"), team: "iOS Development Team"),
    NeonAcademyMember(fullName: "Bilal Yalçın", title: "iOS Developer", horoscope: "Yengeç", memberLevel: "A1", homeTown: "istanbul", age: 27, contactInformation: ContactInformation(phoneNumber: 5362063591, email: "bilal@neonapps.co"), team: "iOS Development Team"),
    NeonAcademyMember(fullName: "Ege Ertan", title: "iOS Developer", horoscope: "Oğlak", memberLevel: "B3", homeTown: "istanbul", age: 23, contactInformation: ContactInformation(phoneNumber: 5367426453, email: "ege@neonapps.co"), team: "iOS Development Team"),
    NeonAcademyMember(fullName: "Mert Çetin", title: "iOS Developer", horoscope: "Oğlak", memberLevel: "B3", homeTown: "istanbul", age: 22, contactInformation: ContactInformation(phoneNumber: 5394593496, email: "mert@neonapps.co"), team: "iOS Development Team"),
    NeonAcademyMember(fullName: "Burak Çiçek", title: "iOS Developer", horoscope: "Oğlak", memberLevel: "A3", homeTown: "Hatay", age: 28, contactInformation: ContactInformation(phoneNumber: 5314344077, email: "burakcicek@neonapps.co"), team: "iOS Development Team"),
    NeonAcademyMember(fullName: "Alper Erden", title: "iOS Developer", horoscope: "Aslan", memberLevel: "A3", homeTown: "Trabzon", age: 24, contactInformation: ContactInformation(phoneNumber: 5372837056, email: "alper@neonapps.co"), team: "iOS Development Team"),
    NeonAcademyMember(fullName: "Berk Ceylan", title: "iOS Developer", horoscope: "Akrep", memberLevel: "A2", homeTown: "Sivas", age: 25, contactInformation: ContactInformation(phoneNumber: 5308843498, email: "berk@neonapps.co"), team: "iOS Development Team"),
    NeonAcademyMember(fullName: "Fatih Kara", title: "iOS Developer", horoscope: "Akrep", memberLevel: "A1", homeTown: "Ankara", age: 24, contactInformation: ContactInformation(phoneNumber: 5318610629, email: "fatih@gmail.com"), team: "iOS Development Team"),
    NeonAcademyMember(fullName: "Karen Aksoy", title: "UI-UX Designer", horoscope: "Balık", memberLevel: "B1", homeTown: "Trabzon", age: 23, contactInformation: ContactInformation(phoneNumber: 5302868996, email: "karen@neonapps.com"), team: "UI/UX Design Team"),
    NeonAcademyMember(fullName: "Aslı Katırcı", title: "UI Designer", horoscope: "Gemini", memberLevel: "A1", homeTown: "Bolu", age: 21, contactInformation: ContactInformation(phoneNumber: 5399134436, email: "asli@neonapps.com"), team: "UI/UX Design Team"),
    NeonAcademyMember(fullName: "Melis Göral", title: "UI Designer", horoscope: "Boğa", memberLevel: "A1", homeTown: "istanbul", age: 26, contactInformation: ContactInformation(phoneNumber: 5426434552, email: "melis@neonapps.com"), team: "UI/UX Design Team"),
    NeonAcademyMember(fullName: "Irfan Ortaeri", title: "UI Designer", horoscope: "Terazi", memberLevel: "A1", homeTown: "istanbul", age: 24, contactInformation: ContactInformation(phoneNumber: 5426434552, email: "irfan@neonapps.com"), team: "UI/UX Design Team"),
    //    NeonAcademyMember(fullName: "Alp Günay", title: "Head of Product", horoscope: "Yay", memberLevel: "D1", homeTown: "Ankara", age: 23, contactInformation: ContactInformation(phoneNumber: 5458411599, email: "alp@neonapps.com")),
    NeonAcademyMember(fullName: "Asu Pınar Aksu", title: "Designer", horoscope: "Yengeç", memberLevel: "A1", homeTown: "istanbul", age: 22, contactInformation: ContactInformation(phoneNumber: 5355768021, email: "asu@neonapps.co"), team: "UI/UX Design Team"),
    NeonAcademyMember(fullName: "Damla Özer", title: "Designer", horoscope: "Aslan", memberLevel: "A1", homeTown: "istanbul", age: 30, contactInformation: ContactInformation(phoneNumber: 5533652311, email: "damla@neonapps.co"), team: "UI/UX Design Team"),
    NeonAcademyMember(fullName: "Selin Sağıroğlu", title: "Designer", horoscope: "Koç", memberLevel: "A1", homeTown: "istanbul", age: 26, contactInformation: ContactInformation(phoneNumber: 5071282968, email: "selin@neonapps.co"), team: "UI/UX Design Team"),
    NeonAcademyMember(fullName: "Esra Özcan", title: "Designer", horoscope: "Başak", memberLevel: "A2", homeTown: "Giresun", age: 24, contactInformation: ContactInformation(phoneNumber: 5394268820, email: "esra@neonapps.co"), team: "UI/UX Design Team"),
    NeonAcademyMember(fullName: "Yahya Tokman", title: "Android Developer", horoscope: "Akrep", memberLevel: "B1", homeTown: "Giresun", age: 24, contactInformation: ContactInformation(phoneNumber: 5392588861, email: "yahya@neonapps.co"), team: "Android Development Team"),
    NeonAcademyMember(fullName: "Ece Handırı", title: "Designer", horoscope: "Başak", memberLevel: "A1", homeTown: "istanbul", age: 24, contactInformation: ContactInformation(phoneNumber: 5548867664, email: "ece@neonapps.co"), team: "UI/UX Design Team"),
    NeonAcademyMember(fullName: "Emre Yılmaz", title: "Designer", horoscope: "Boğa", memberLevel: "A1", homeTown: "istanbul", age: 28, contactInformation: ContactInformation(phoneNumber: 5057823987, email: "emre@neonapps.co"), team: "UI/UX Design Team"),
    //    NeonAcademyMember(fullName: "Tuna Öztürk", title: "Co-Founder", horoscope: "Boğa", memberLevel: "D4", homeTown: "istanbul", age: 30, contactInformation: ContactInformation(phoneNumber: 50578267897, email: "tuna@neonapps.co"), team: <#String#>),
    //    NeonAcademyMember(fullName: "Destan Keskinkılıç", title: "Co-Founder", horoscope: "Yengeç", memberLevel: "D4", homeTown: "istanbul", age: 29, contactInformation: ContactInformation(phoneNumber: 5057823985, email: "destan@neonapps.co"), team: <#String#>),
    //    NeonAcademyMember(fullName: "Zeynep Kahveci", title: "Human Resources", horoscope: "Balık", memberLevel: "D2", homeTown: "istanbul", age: 25, contactInformation: ContactInformation(phoneNumber: 5057823984, email: "zeynep@neonapps.co"), team: <#String#>),
    //    NeonAcademyMember(fullName: "Batuhan Bağış", title: "Sales", horoscope: "Akrep", memberLevel: "D3", homeTown: "istanbul", age: 28, contactInformation: ContactInformation(phoneNumber: 5057823983, email: "batuhan@neonapps.co"), team: <#String#>),
    
    
]
