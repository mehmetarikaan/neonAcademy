import UIKit


class NeonAcademyMember {
    var fullName: String
    var title: String
    var horoscope: String
    var memberLevel: String
    var homeTown: String
    var age: Int
    var contactInformation: ContactInformation
 
    
    init(fullName: String, title: String, horoscope: String, memberLevel: String, homeTown: String, age: Int, contactInformation: ContactInformation) {
        self.fullName = fullName
        self.title = title
        self.horoscope = horoscope
        self.memberLevel = memberLevel
        self.homeTown = homeTown
        self.age = age
        self.contactInformation = contactInformation
    }
    
}

class ContactInformation{
    var phoneNumber: Int
    var email: String
    
    init(phoneNumber: Int, email: String){
        self.phoneNumber = phoneNumber
        self.email = email
    }
}

let teamMember = [
    NeonAcademyMember(fullName: "Mehmet Arıkan", title: "iOS Developer", horoscope: "Boğa", memberLevel: "A1", homeTown: "Malatya", age: 23, contactInformation: ContactInformation(phoneNumber: 05070554436, email: "mehmet@neonapps.co")),
    NeonAcademyMember(fullName: "Oğuzhan Akın", title: "iOS Developer", horoscope: "İkizler", memberLevel: "A1", homeTown: "Ordu", age: 26, contactInformation: ContactInformation(phoneNumber: 5318610629, email: "oguzhan@neonapps.co")),
    NeonAcademyMember(fullName: "Ali Beyaz", title: "iOS Developer", horoscope: "İkizler", memberLevel: "A1", homeTown: "Ordu", age: 27, contactInformation: ContactInformation(phoneNumber: 5322583505, email: "ali@neonapps.co")),
    NeonAcademyMember(fullName: "Anıl Sezer", title: "iOS Developer", horoscope: "Yengeç", memberLevel: "A1", homeTown: "Giresun", age: 24, contactInformation: ContactInformation(phoneNumber: 5362929275, email: "anil@neonapps.co")),
    NeonAcademyMember(fullName: "Seyhun Koçak", title: "iOS Developer", horoscope: "İkizler", memberLevel: "A1", homeTown: "Manisa", age: 27, contactInformation: ContactInformation(phoneNumber: 5056695330, email: "seyhun@neonapps.co")),
    NeonAcademyMember(fullName: "Eymen Varilci", title: "iOS Developer", horoscope: "Balık", memberLevel: "A1", homeTown: "Ordu", age: 26, contactInformation: ContactInformation(phoneNumber: 5344098326, email: "eymen@neonapps.co")),
    NeonAcademyMember(fullName: "Oğuzhan Satılmış", title: "Android Developer", horoscope: "İkizler", memberLevel: "A1", homeTown: "Tekirdağ", age: 25, contactInformation: ContactInformation(phoneNumber: 05426791619, email: "oguzhansatilmis@neonapps.co")),
    NeonAcademyMember(fullName: "Atilla Eren", title: "Android Developer", horoscope: "Aslan", memberLevel: "A1", homeTown: "Malatya", age: 28, contactInformation: ContactInformation(phoneNumber: 05459707600, email: "atilla@neonapps.co")),
    NeonAcademyMember(fullName: "Nesrin Bozan", title: "iOS Developer", horoscope: "Oğlak", memberLevel: "A1", homeTown: "Adıyaman", age: 24, contactInformation: ContactInformation(phoneNumber: 05462093402, email: "nesrin@neonapps.co")),
    NeonAcademyMember(fullName: "Bilal Yalçın", title: "iOS Developer", horoscope: "Yengeç", memberLevel: "A1", homeTown: "İstanbul", age: 27, contactInformation: ContactInformation(phoneNumber: 05362063591, email: "bilal@neonapps.co")),
    NeonAcademyMember(fullName: "Ege Ertan", title: "iOS Developer", horoscope: "Oğlak", memberLevel: "B3", homeTown: "İstanbul", age: 23, contactInformation: ContactInformation(phoneNumber: 05367426453, email: "ege@neonapps.co")),
    NeonAcademyMember(fullName: "Mert Çetin", title: "iOS Developer", horoscope: "Oğlak", memberLevel: "B3", homeTown: "İstanbul", age: 22, contactInformation: ContactInformation(phoneNumber: 05394593496, email: "mert@neonapps.co")),
    NeonAcademyMember(fullName: "Burak Çiçek", title: "iOS Developer", horoscope: "Oğlak", memberLevel: "A3", homeTown: "Hatay", age: 28, contactInformation: ContactInformation(phoneNumber: 05314344077, email: "burakcicek@neonapps.co")),
    NeonAcademyMember(fullName: "Alper Erden", title: "iOS Developer", horoscope: "Aslan", memberLevel: "A3", homeTown: "Trabzon", age: 24, contactInformation: ContactInformation(phoneNumber: 05372837056, email: "alper@neonapps.co")),
    NeonAcademyMember(fullName: "Berk Ceylan", title: "iOS Developer", horoscope: "Akrep", memberLevel: "A2", homeTown: "Sivas", age: 25, contactInformation: ContactInformation(phoneNumber: 05308843498, email: "berk@neonapps.co")),
    NeonAcademyMember(fullName: "Fatih Kara", title: "iOS Developer", horoscope: "Akrep", memberLevel: "A1", homeTown: "Ankara", age: 24, contactInformation: ContactInformation(phoneNumber: 05318610629, email: "fatih@gmail.com")),
    NeonAcademyMember(fullName: "Karen Aksoy", title: "UI-UX Designer", horoscope: "Balık", memberLevel: "B1", homeTown: "Trabzon", age: 23, contactInformation: ContactInformation(phoneNumber: 05302868996, email: "karen@neonapps.com")),
    NeonAcademyMember(fullName: "Aslı Katırcı", title: "UI Designer", horoscope: "Gemini", memberLevel: "A1", homeTown: "Bolu", age: 21, contactInformation: ContactInformation(phoneNumber: 05399134436, email: "asli@neonapps.com")),
    NeonAcademyMember(fullName: "Melis Göral", title: "UI Designer", horoscope: "Boğa", memberLevel: "A1", homeTown: "İstanbul", age: 26, contactInformation: ContactInformation(phoneNumber: 05426434552, email: "melis@neonapps.com")),
    NeonAcademyMember(fullName: "İrfan Ortaeri", title: "UI Designer", horoscope: "Terazi", memberLevel: "A1", homeTown: "İstanbul", age: 24, contactInformation: ContactInformation(phoneNumber: 05426434552, email: "irfan@neonapps.com")),
    NeonAcademyMember(fullName: "Alp Günay", title: "Head of Product", horoscope: "Yay", memberLevel: "D1", homeTown: "Ankara", age: 23, contactInformation: ContactInformation(phoneNumber: 05458411599, email: "alp@neonapps.com")),
    NeonAcademyMember(fullName: "Asu Pınar Aksu", title: "Designer", horoscope: "Yengeç", memberLevel: "A1", homeTown: "İstanbul", age: 22, contactInformation: ContactInformation(phoneNumber: 05355768021, email: "asu@neonapps.co")),
    NeonAcademyMember(fullName: "Damla Özer", title: "Designer", horoscope: "Aslan", memberLevel: "A1", homeTown: "İstanbul", age: 30, contactInformation: ContactInformation(phoneNumber: 05533652311, email: "damla@neonapps.co")),
    NeonAcademyMember(fullName: "Selin Sağıroğlu", title: "Designer", horoscope: "Koç", memberLevel: "A1", homeTown: "İstanbul", age: 26, contactInformation: ContactInformation(phoneNumber: 05071282968, email: "selin@neonapps.co")),
    NeonAcademyMember(fullName: "Esra Özcan", title: "Designer", horoscope: "Başak", memberLevel: "A2", homeTown: "Giresun", age: 24, contactInformation: ContactInformation(phoneNumber: 05394268820, email: "esra@neonapps.co")),
    NeonAcademyMember(fullName: "Yahya Tokman", title: "Android Developer", horoscope: "Akrep", memberLevel: "B1", homeTown: "Giresun", age: 24, contactInformation: ContactInformation(phoneNumber: 5392588861, email: "yahya@neonapps.co")),
    NeonAcademyMember(fullName: "Ece Handırı", title: "Designer", horoscope: "Başak", memberLevel: "A1", homeTown: "İstanbul", age: 24, contactInformation: ContactInformation(phoneNumber: 5548867664, email: "ece@neonapps.co")),
    NeonAcademyMember(fullName: "Emre Yılmaz", title: "Designer", horoscope: "Boğa", memberLevel: "A1", homeTown: "İstanbul", age: 28, contactInformation: ContactInformation(phoneNumber: 5057823983, email: "emre@neonapps.co")),
    

]

print((teamMember.count))

for member in teamMember {
    print("****************************************** Neon Academy Team Members Information Data ******************************************")
    print("Full Name:           \(member.fullName)")
    print("Title:               \(member.title)")
    print("Horoscope:           \(member.horoscope)")
    print("MemberLevel:         \(member.memberLevel)")
    print("HomeTown:            \(member.homeTown)")
    print("Age:                 \(member.age)")
    print("Email:               \(member.contactInformation.email)")
    print("Phone Number:        \(member.contactInformation.phoneNumber)")
}
