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

var teamMember = [
    NeonAcademyMember(fullName: "Mehmet Arıkan", title: "iOS Developer", horoscope: "Boğa", memberLevel: "A1", homeTown: "Malatya", age: 23, contactInformation: ContactInformation(phoneNumber: 5070554436, email: "mehmet@neonapps.co")),
    NeonAcademyMember(fullName: "Oğuzhan Akın", title: "iOS Developer", horoscope: "İkizler", memberLevel: "A1", homeTown: "Ordu", age: 26, contactInformation: ContactInformation(phoneNumber: 5318610629, email: "oguzhan@neonapps.co")),
    NeonAcademyMember(fullName: "Ali Beyaz", title: "iOS Developer", horoscope: "İkizler", memberLevel: "A1", homeTown: "Ordu", age: 27, contactInformation: ContactInformation(phoneNumber: 5322583505, email: "ali@neonapps.co")),
    NeonAcademyMember(fullName: "Anıl Sezer", title: "iOS Developer", horoscope: "Yengeç", memberLevel: "A1", homeTown: "Giresun", age: 24, contactInformation: ContactInformation(phoneNumber: 5362929275, email: "anil@neonapps.co")),
    NeonAcademyMember(fullName: "Seyhun Koçak", title: "iOS Developer", horoscope: "İkizler", memberLevel: "A1", homeTown: "Manisa", age: 27, contactInformation: ContactInformation(phoneNumber: 5056695330, email: "seyhun@neonapps.co")),
    NeonAcademyMember(fullName: "Eymen Varilci", title: "iOS Developer", horoscope: "Balık", memberLevel: "A1", homeTown: "Ordu", age: 26, contactInformation: ContactInformation(phoneNumber: 5344098326, email: "eymen@neonapps.co")),
    NeonAcademyMember(fullName: "Oğuzhan Satılmış", title: "Android Developer", horoscope: "İkizler", memberLevel: "A1", homeTown: "Tekirdağ", age: 25, contactInformation: ContactInformation(phoneNumber: 5426791619, email: "oguzhansatilmis@neonapps.co")),
    NeonAcademyMember(fullName: "Atilla Eren", title: "Android Developer", horoscope: "Aslan", memberLevel: "A1", homeTown: "Malatya", age: 28, contactInformation: ContactInformation(phoneNumber: 5459707600, email: "atilla@neonapps.co")),
    NeonAcademyMember(fullName: "Nesrin Bozan", title: "iOS Developer", horoscope: "Oğlak", memberLevel: "A1", homeTown: "Adıyaman", age: 24, contactInformation: ContactInformation(phoneNumber: 5462093402, email: "nesrin@neonapps.co")),
    NeonAcademyMember(fullName: "Bilal Yalçın", title: "iOS Developer", horoscope: "Yengeç", memberLevel: "A1", homeTown: "istanbul", age: 27, contactInformation: ContactInformation(phoneNumber: 5362063591, email: "bilal@neonapps.co")),
    NeonAcademyMember(fullName: "Ege Ertan", title: "iOS Developer", horoscope: "Oğlak", memberLevel: "B3", homeTown: "istanbul", age: 23, contactInformation: ContactInformation(phoneNumber: 5367426453, email: "ege@neonapps.co")),
    NeonAcademyMember(fullName: "Mert Çetin", title: "iOS Developer", horoscope: "Oğlak", memberLevel: "B3", homeTown: "istanbul", age: 22, contactInformation: ContactInformation(phoneNumber: 5394593496, email: "mert@neonapps.co")),
    NeonAcademyMember(fullName: "Burak Çiçek", title: "iOS Developer", horoscope: "Oğlak", memberLevel: "A3", homeTown: "Hatay", age: 28, contactInformation: ContactInformation(phoneNumber: 5314344077, email: "burakcicek@neonapps.co")),
    NeonAcademyMember(fullName: "Alper Erden", title: "iOS Developer", horoscope: "Aslan", memberLevel: "A3", homeTown: "Trabzon", age: 24, contactInformation: ContactInformation(phoneNumber: 5372837056, email: "alper@neonapps.co")),
    NeonAcademyMember(fullName: "Berk Ceylan", title: "iOS Developer", horoscope: "Akrep", memberLevel: "A2", homeTown: "Sivas", age: 25, contactInformation: ContactInformation(phoneNumber: 5308843498, email: "berk@neonapps.co")),
    NeonAcademyMember(fullName: "Fatih Kara", title: "iOS Developer", horoscope: "Akrep", memberLevel: "A1", homeTown: "Ankara", age: 24, contactInformation: ContactInformation(phoneNumber: 5318610629, email: "fatih@gmail.com")),
    NeonAcademyMember(fullName: "Karen Aksoy", title: "UI-UX Designer", horoscope: "Balık", memberLevel: "B1", homeTown: "Trabzon", age: 23, contactInformation: ContactInformation(phoneNumber: 5302868996, email: "karen@neonapps.com")),
    NeonAcademyMember(fullName: "Aslı Katırcı", title: "UI Designer", horoscope: "Gemini", memberLevel: "A1", homeTown: "Bolu", age: 21, contactInformation: ContactInformation(phoneNumber: 5399134436, email: "asli@neonapps.com")),
    NeonAcademyMember(fullName: "Melis Göral", title: "UI Designer", horoscope: "Boğa", memberLevel: "A1", homeTown: "istanbul", age: 26, contactInformation: ContactInformation(phoneNumber: 5426434552, email: "melis@neonapps.com")),
    NeonAcademyMember(fullName: "Irfan Ortaeri", title: "UI Designer", horoscope: "Terazi", memberLevel: "A1", homeTown: "istanbul", age: 24, contactInformation: ContactInformation(phoneNumber: 5426434552, email: "irfan@neonapps.com")),
    NeonAcademyMember(fullName: "Alp Günay", title: "Head of Product", horoscope: "Yay", memberLevel: "D1", homeTown: "Ankara", age: 23, contactInformation: ContactInformation(phoneNumber: 5458411599, email: "alp@neonapps.com")),
    NeonAcademyMember(fullName: "Asu Pınar Aksu", title: "Designer", horoscope: "Yengeç", memberLevel: "A1", homeTown: "istanbul", age: 22, contactInformation: ContactInformation(phoneNumber: 5355768021, email: "asu@neonapps.co")),
    NeonAcademyMember(fullName: "Damla Özer", title: "Designer", horoscope: "Aslan", memberLevel: "A1", homeTown: "istanbul", age: 30, contactInformation: ContactInformation(phoneNumber: 5533652311, email: "damla@neonapps.co")),
    NeonAcademyMember(fullName: "Selin Sağıroğlu", title: "Designer", horoscope: "Koç", memberLevel: "A1", homeTown: "istanbul", age: 26, contactInformation: ContactInformation(phoneNumber: 5071282968, email: "selin@neonapps.co")),
    NeonAcademyMember(fullName: "Esra Özcan", title: "Designer", horoscope: "Başak", memberLevel: "A2", homeTown: "Giresun", age: 24, contactInformation: ContactInformation(phoneNumber: 5394268820, email: "esra@neonapps.co")),
    NeonAcademyMember(fullName: "Yahya Tokman", title: "Android Developer", horoscope: "Akrep", memberLevel: "B1", homeTown: "Giresun", age: 24, contactInformation: ContactInformation(phoneNumber: 5392588861, email: "yahya@neonapps.co")),
    NeonAcademyMember(fullName: "Ece Handırı", title: "Designer", horoscope: "Başak", memberLevel: "A1", homeTown: "istanbul", age: 24, contactInformation: ContactInformation(phoneNumber: 5548867664, email: "ece@neonapps.co")),
    NeonAcademyMember(fullName: "Emre Yılmaz", title: "Designer", horoscope: "Boğa", memberLevel: "A1", homeTown: "istanbul", age: 28, contactInformation: ContactInformation(phoneNumber: 5057823987, email: "emre@neonapps.co")),
    NeonAcademyMember(fullName: "Tuna Öztürk", title: "Co-Founder", horoscope: "Boğa", memberLevel: "D4", homeTown: "istanbul", age: 30, contactInformation: ContactInformation(phoneNumber: 50578267897, email: "tuna@neonapps.co")),
    NeonAcademyMember(fullName: "Destan Keskinkılıç", title: "Co-Founder", horoscope: "Yengeç", memberLevel: "D4", homeTown: "istanbul", age: 29, contactInformation: ContactInformation(phoneNumber: 5057823985, email: "destan@neonapps.co")),
    NeonAcademyMember(fullName: "Zeynep Kahveci", title: "Human Resources", horoscope: "Balık", memberLevel: "D2", homeTown: "istanbul", age: 25, contactInformation: ContactInformation(phoneNumber: 5057823984, email: "zeynep@neonapps.co")),
    NeonAcademyMember(fullName: "Batuhan Bağış", title: "Sales", horoscope: "Akrep", memberLevel: "D3", homeTown: "istanbul", age: 28, contactInformation: ContactInformation(phoneNumber: 5057823983, email: "batuhan@neonapps.co")),
    

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



print("*********************************************************  ARRAYS TASK ****************************************************************************")
print("Delete the 3rd member.")
//MARK: - Delete the 3rd member.

print(teamMember[3].fullName)
teamMember.remove(at: 3)
print(teamMember[3].fullName)

print("**************************************************************************************************************************************")
print("Rank the members according to their age from largest to smallest.")
//MARK: - Rank the members according to their age from largest to smallest.

var sortedAge = teamMember.sorted(by: {$0.age > $1.age})
for sort in sortedAge {
    print("\(sort.age) - \(sort.fullName)")
}

print("****************************************************************************************************************************************")
print("Sort the members according to their names (Z-A).")
//MARK: - Sort the members according to their names (Z-A).

var sortedAlpha = teamMember.sorted(by: {$0.fullName > $1.fullName})

for sort in sortedAlpha {
    print("\(sort.fullName)")
}

print("***************************************************************************************************************************************")
print("Filter the members of the Academy who are older than 24 and transfer them to a new array. Print the names of the members in this array.")
//MARK: - Filter the members of the Academy who are older than 24 and transfer them to a new array. Print the names of the members in this array.

var filtered = teamMember.filter{$0.age > 24}
var newArrayFilter: [String] = []

for sort in filtered {
    newArrayFilter.append(sort.fullName)
}

for sort in newArrayFilter{
    print(sort)
}

print("***************************************************************************************************************************************")
print("Print the total number of iOS Developers.")
//MARK: - Print the total number of iOS Developers.

let filterediOSDev = teamMember.filter { $0.title.contains("iOS Developer")}
print("iOS Developer Total Number: \(filterediOSDev.count)")

print("***************************************************************************************************************************************")
print("Find which index you come across in the array and print it.")
//MARK: - Find which index you come across in the array and print it.

for (index, name) in teamMember.enumerated(){
    print("İndex: \(index) - Name: \(name.fullName)")
}

print("***************************************************************************************************************************************")
print("Remove all members who have a specific memberLevel, for example, 'A1', and print out the remaining members' full names.")
//MARK: - Remove all members who have a specific memberLevel, for example, 'A1', and print out the remaining members' full names.

var filteredA1 = teamMember.filter{$0.memberLevel != "A1"}
for member in filteredA1 {
    print(member.fullName)
}

print("***************************************************************************************************************************************")
print("Find the member with the highest age and print out their full name and age.")
//MARK: - Find the member with the highest age and print out their full name and age.

var highest = teamMember.max(by: {$0.age < $1.age})
print("Full Name: \(highest!.fullName), Age: \(highest!.age)")

print("***************************************************************************************************************************************")
print("Find the member with the longest name and print out their full name and the length of their name.")
//MARK: - Find the member with the longest name and print out their full name and the length of their name.

var sortedLongest = teamMember.sorted(by: {$0.fullName.count > $1.fullName.count})
var lengthMember = sortedLongest.first!.fullName
print("Full Name: \(lengthMember) - lengthCount: \(lengthMember.count)")

print("***************************************************************************************************************************************")
print("Find all members who have the same horoscope sign and group them together in a new array. Print out the full names of members in this new array.")
//MARK: - Find all members who have the same horoscope sign and group them together in a new array. Print out the full names of members in this new array.


let horos = teamMember.filter{$0.horoscope == "Oğlak"}
for name in horos {
    print(name.fullName)
}

print("***************************************************************************************************************************************")
print("Find the most common hometown among the members and print out the name of the town.")
//MARK: - Find the most common hometown among the members and print out the name of the town.

let town = teamMember.sorted(by: {$0.homeTown > $1.homeTown})
let townHighest = town[0].homeTown
print(townHighest)

print("***************************************************************************************************************************************")
print("Find the average age of all members and print out the result.")
//MARK: - Find the average age of all members and print out the result.

var ageAverage = [Int]()

for age in teamMember {
    ageAverage.append(age.age)
}
 
let total = ageAverage.reduce(0, +)
print("Average: \(total/(ageAverage.count))")

print("***************************************************************************************************************************************")
print("Create a new array that contains only the contact information of the members, and print out the email addresses of all members in this new array.")
//MARK: - Create a new array that contains only the contact information of the members, and print out the email addresses of all members in this new array.

var contactInfo = [String]()

for mail in teamMember{
    contactInfo.append(mail.contactInformation.email)
}

for newMail in contactInfo{
    print(newMail)
}

print("***************************************************************************************************************************************")
print("Sort the members according to their memberLevel (highest to lowest) and print out their full names.")
//MARK: - Sort the members according to their memberLevel (highest to lowest) and print out their full names.

let memberLevels = teamMember.sorted(by: {$0.memberLevel > $1.memberLevel})
for HighestToLowest in memberLevels {
    print("\(HighestToLowest.memberLevel) - \(HighestToLowest.fullName)")
}


print("***************************************************************************************************************************************")
print("Find all members who have the same title and create a new array of their contact information, then print out the phone numbers of all members in this new array.")
//MARK: - Find all members who have the same title and create a new array of their contact information, then print out the phone numbers of all members in this new array.


var groupedMembers = [String: [String] ]()

        for member in teamMember {
            let title = member.title
            let name = member.fullName
            let phone = member.contactInformation.phoneNumber

            if groupedMembers[title] == nil {
                groupedMembers[title] = [name]
            } else {
                groupedMembers[title]?.append(name)
                groupedMembers[title]?.append(String(phone))
            
            }
        }

        for (titles, phones) in groupedMembers {
            print("Members with \(titles) title:")
            for phone in phones {
                print(phone)
            }
            print("")
        }




