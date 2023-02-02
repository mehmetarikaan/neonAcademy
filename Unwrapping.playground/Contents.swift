import UIKit



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

class ContactInformation{
    var phoneNumber: Int
    var email: String
    
    init(phoneNumber: Int, email: String){
        self.phoneNumber = phoneNumber
        self.email = email
    }
}

var teamMember = [
    NeonAcademyMember(fullName: "Mehmet Arıkan", title: "iOS Developer", horoscope: "Boğa", memberLevel: "A1", homeTown: "Malatya", age: 23, contactInformation: ContactInformation(phoneNumber: 5070554436, email: "mehmet@neonapps.co"), team: "iOS Development Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Oğuzhan Akın", title: "iOS Developer", horoscope: "İkizler", memberLevel: "A1", homeTown: "Ordu", age: 26, contactInformation: ContactInformation(phoneNumber: 5318610629, email: "oguzhan@neonapps.co"), team: "iOS Development Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Ali Beyaz", title: "iOS Developer", horoscope: "İkizler", memberLevel: "A1", homeTown: "Ordu", age: 27, contactInformation: ContactInformation(phoneNumber: 5322583505, email: "ali@neonapps.co"), team: "iOS Development Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Anıl Sezer", title: "iOS Developer", horoscope: "Yengeç", memberLevel: "A1", homeTown: "Giresun", age: 24, contactInformation: ContactInformation(phoneNumber: 5362929275, email: "anil@neonapps.co"), team: "iOS Development Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Seyhun Koçak", title: "iOS Developer", horoscope: "İkizler", memberLevel: "A1", homeTown: "Manisa", age: 27, contactInformation: ContactInformation(phoneNumber: 5056695330, email: "seyhun@neonapps.co"), team: "iOS Development Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Eymen Varilci", title: "iOS Developer", horoscope: "Balık", memberLevel: "A1", homeTown: "Ordu", age: 26, contactInformation: ContactInformation(phoneNumber: 5344098326, email: "eymen@neonapps.co"), team: "iOS Development Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Oğuzhan Satılmış", title: "Android Developer", horoscope: "İkizler", memberLevel: "A1", homeTown: "Tekirdağ", age: 25, contactInformation: ContactInformation(phoneNumber: 5426791619, email: "oguzhansatilmis@neonapps.co"), team: "Android Development Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Atilla Eren", title: "Android Developer", horoscope: "Aslan", memberLevel: "A1", homeTown: "Malatya", age: 28, contactInformation: ContactInformation(phoneNumber: 5459707600, email: "atilla@neonapps.co"), team: "Android Development Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Nesrin Bozan", title: "iOS Developer", horoscope: "Oğlak", memberLevel: "A1", homeTown: "Adıyaman", age: 24, contactInformation: ContactInformation(phoneNumber: 5462093402, email: "nesrin@neonapps.co"), team: "iOS Development Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Bilal Yalçın", title: "iOS Developer", horoscope: "Yengeç", memberLevel: "A1", homeTown: "istanbul", age: 27, contactInformation: ContactInformation(phoneNumber: 5362063591, email: "bilal@neonapps.co"), team: "iOS Development Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Ege Ertan", title: "iOS Developer", horoscope: "Oğlak", memberLevel: "B3", homeTown: "istanbul", age: 23, contactInformation: ContactInformation(phoneNumber: 5367426453, email: "ege@neonapps.co"), team: "iOS Development Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Mert Çetin", title: "iOS Developer", horoscope: "Oğlak", memberLevel: "B3", homeTown: "istanbul", age: 22, contactInformation: ContactInformation(phoneNumber: 5394593496, email: "mert@neonapps.co"), team: "iOS Development Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Burak Çiçek", title: "iOS Developer", horoscope: "Oğlak", memberLevel: "A3", homeTown: "Hatay", age: 28, contactInformation: ContactInformation(phoneNumber: 5314344077, email: "burakcicek@neonapps.co"), team: "iOS Development Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Alper Erden", title: "iOS Developer", horoscope: "Aslan", memberLevel: "A3", homeTown: "Trabzon", age: 24, contactInformation: ContactInformation(phoneNumber: 5372837056, email: "alper@neonapps.co"), team: "iOS Development Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Berk Ceylan", title: "iOS Developer", horoscope: "Akrep", memberLevel: "A2", homeTown: "Sivas", age: 25, contactInformation: ContactInformation(phoneNumber: 5308843498, email: "berk@neonapps.co"), team: "iOS Development Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Fatih Kara", title: "iOS Developer", horoscope: "Akrep", memberLevel: "A1", homeTown: "Ankara", age: 24, contactInformation: ContactInformation(phoneNumber: 5318610629, email: "fatih@gmail.com"), team: "iOS Development Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Karen Aksoy", title: "UI-UX Designer", horoscope: "Balık", memberLevel: "B1", homeTown: "Trabzon", age: 23, contactInformation: ContactInformation(phoneNumber: 5302868996, email: "karen@neonapps.com"), team: "UI/UX Design Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Aslı Katırcı", title: "UI Designer", horoscope: "Gemini", memberLevel: "A1", homeTown: "Bolu", age: 21, contactInformation: ContactInformation(phoneNumber: 5399134436, email: "asli@neonapps.com"), team: "UI/UX Design Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Melis Göral", title: "UI Designer", horoscope: "Boğa", memberLevel: "A1", homeTown: "istanbul", age: 26, contactInformation: ContactInformation(phoneNumber: 5426434552, email: "melis@neonapps.com"), team: "UI/UX Design Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Irfan Ortaeri", title: "UI Designer", horoscope: "Terazi", memberLevel: "A1", homeTown: "istanbul", age: 24, contactInformation: ContactInformation(phoneNumber: 5426434552, email: "irfan@neonapps.com"), team: "UI/UX Design Team", motivationLevel: nil),
    //    NeonAcademyMember(fullName: "Alp Günay", title: "Head of Product", horoscope: "Yay", memberLevel: "D1", homeTown: "Ankara", age: 23, contactInformation: ContactInformation(phoneNumber: 5458411599, email: "alp@neonapps.com")),
    NeonAcademyMember(fullName: "Asu Pınar Aksu", title: "Designer", horoscope: "Yengeç", memberLevel: "A1", homeTown: "istanbul", age: 22, contactInformation: ContactInformation(phoneNumber: 5355768021, email: "asu@neonapps.co"), team: "UI/UX Design Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Damla Özer", title: "Designer", horoscope: "Aslan", memberLevel: "A1", homeTown: "istanbul", age: 30, contactInformation: ContactInformation(phoneNumber: 5533652311, email: "damla@neonapps.co"), team: "UI/UX Design Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Selin Sağıroğlu", title: "Designer", horoscope: "Koç", memberLevel: "A1", homeTown: "istanbul", age: 26, contactInformation: ContactInformation(phoneNumber: 5071282968, email: "selin@neonapps.co"), team: "UI/UX Design Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Esra Özcan", title: "Designer", horoscope: "Başak", memberLevel: "A2", homeTown: "Giresun", age: 24, contactInformation: ContactInformation(phoneNumber: 5394268820, email: "esra@neonapps.co"), team: "UI/UX Design Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Yahya Tokman", title: "Android Developer", horoscope: "Akrep", memberLevel: "B1", homeTown: "Giresun", age: 24, contactInformation: ContactInformation(phoneNumber: 5392588861, email: "yahya@neonapps.co"), team: "Android Development Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Ece Handırı", title: "Designer", horoscope: "Başak", memberLevel: "A1", homeTown: "istanbul", age: 24, contactInformation: ContactInformation(phoneNumber: 5548867664, email: "ece@neonapps.co"), team: "UI/UX Design Team", motivationLevel: nil),
    NeonAcademyMember(fullName: "Emre Yılmaz", title: "Designer", horoscope: "Boğa", memberLevel: "A1", homeTown: "istanbul", age: 28, contactInformation: ContactInformation(phoneNumber: 5057823987, email: "emre@neonapps.co"), team: "UI/UX Design Team", motivationLevel: nil),
    //    NeonAcademyMember(fullName: "Tuna Öztürk", title: "Co-Founder", horoscope: "Boğa", memberLevel: "D4", homeTown: "istanbul", age: 30, contactInformation: ContactInformation(phoneNumber: 50578267897, email: "tuna@neonapps.co"), team: <#String#>),
    //    NeonAcademyMember(fullName: "Destan Keskinkılıç", title: "Co-Founder", horoscope: "Yengeç", memberLevel: "D4", homeTown: "istanbul", age: 29, contactInformation: ContactInformation(phoneNumber: 5057823985, email: "destan@neonapps.co"), team: <#String#>),
    //    NeonAcademyMember(fullName: "Zeynep Kahveci", title: "Human Resources", horoscope: "Balık", memberLevel: "D2", homeTown: "istanbul", age: 25, contactInformation: ContactInformation(phoneNumber: 5057823984, email: "zeynep@neonapps.co"), team: <#String#>),
    //    NeonAcademyMember(fullName: "Batuhan Bağış", title: "Sales", horoscope: "Akrep", memberLevel: "D3", homeTown: "istanbul", age: 28, contactInformation: ContactInformation(phoneNumber: 5057823983, email: "batuhan@neonapps.co"), team: <#String#>),
    
    
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




print("********************************************************* ENUM-SWITCH TASK ****************************************************************************")

enum Team {
    case iOS
    case Android
    case Design
}


print("Create a new array that contains only the members of the iOS Development Team and print out their full names.")
//MARK: - Create a new array that contains only the members of the iOS Development Team and print out their full names.

func teamMember(team: Team){
    switch team{
    case .iOS:
        var nameiOS = teamMember.filter({$0.team == "iOS Development Team"})
        print("iOS Developers: ")
        for (index, name) in nameiOS.enumerated() {
            print(index + 1, name.fullName)
        }
    case .Android:
        var nameAndroid = teamMember.filter({$0.team == "Android Development Team"})
        print("Android Developers: ")
        for(index, name) in nameAndroid.enumerated() {
            print(index + 1, name.fullName)
        }
    case .Design:
        var nameDesign = teamMember.filter({$0.team == "UI/UX Design Team"})
        print("Design Developers: ")
        for(index, name) in nameDesign.enumerated() {
            print(index + 1, name.fullName)
        }
    }
}

teamMember(team: .iOS)


print("**************************************************************************************************************************************")
print("Create a dictionary that contains the number of members in each team, and print out the number of members in the UI/UX Design Team.")
//MARK: - Create a dictionary that contains the number of members in each team, and print out the number of members in the UI/UX Design Team.

func calculateTeamCount(team: Team){
    switch team{
    case .iOS:
        print("iOS Developer Count:", teamMember.filter({$0.team == "iOS Development Team"}).count)
    case .Android:
        print("Android Developer Count:", teamMember.filter({$0.team == "Android Development Team"}).count)
    case .Design:
        print("Design Team Count:", teamMember.filter({$0.team == "UI/UX Design Team"}).count)
    }
}

calculateTeamCount(team: .Design)


print("**************************************************************************************************************************************")
print("Create a function that takes a team as an input and prints out the full names of all members in that team.")
//MARK: - Create a function that takes a team as an input and prints out the full names of all members in that team.

func teamInfo(team: Team){
    switch team{
    case .iOS:
        var nameiOS = teamMember.filter({$0.team == "iOS Development Team"})
        print("iOS Developers: ")
        for (index, name) in nameiOS.enumerated() {
            print(index + 1, name.fullName)
        }
    case .Android:
        var nameAndroid = teamMember.filter({$0.team == "Android Development Team"})
        print("Android Developers: ")
        for(index, name) in nameAndroid.enumerated() {
            print(index + 1, name.fullName)
        }
    case .Design:
        var nameDesign = teamMember.filter({$0.team == "UI/UX Design Team"})
        print("Design Developers: ")
        for(index, name) in nameDesign.enumerated() {
            print(index + 1, name.fullName)
        }
    }
}

teamInfo(team: .Design)


print("**************************************************************************************************************************************")
print("Create a switch statement that performs different actions based on the team of a member. For example, if a member is in the iOS Development Team, the function could print out 'This member is a skilled iOS developer', and if the member is in the UI/UX Design Team, the function could print out 'This member is a talented designer'.")
//MARK: - Create a switch statement that performs different actions based on the team of a member. For example, if a member is in the iOS Development Team, the function could print out "This member is a skilled iOS developer", and if the member is in the UI/UX Design Team, the function could print out "This member is a talented designer".

func inputCaseMember(member: String, team: Team){
    switch team{
    case .iOS:
        print("\(member) This member is a skilled iOS developer")
    case .Android:
        print("\(member) This member is a skilled Android developer")
    case .Design:
        print("\(member) This member is a talented designer")
    }
}

inputCaseMember(member: "Mehmet", team: .iOS)

print("**************************************************************************************************************************************")
print("Create a function that takes an age as an input and prints out the full names of all members that are older than that age and belong to a specific team (iOS Development Team for example)")
//MARK: - Create a function that takes an age as an input and prints out the full names of all members that are older than that age and belong to a specific team (iOS Development Team for example)

func ageFindMember(team: Team, age: Int){
    switch team {
    case .iOS:
        let filteredAge = teamMember.filter({$0.age > age && $0.team == "iOS Development Team"})
        for member in filteredAge{
            print("Full Name: \(member.fullName)")
        }
    case .Android:
        let filteredAge = teamMember.filter({$0.age > age && $0.team == "Android Development Team"})
        for member in filteredAge{
            print("Full Name: \(member.fullName)")
        }
    case .Design:
        let filteredAge = teamMember.filter({$0.age > age && $0.team == "UI/UX Design Team"})
        for member in filteredAge{
            print("Full Name: \(member.fullName)")
        }
    }
}

ageFindMember(team: .iOS, age: 24)


print("**************************************************************************************************************************************")
print("Create a switch statement that gives a promotion to a member based on their team. For example, if a member is in the iOS Development Team, the function could promote them to 'Senior iOS Developer' and if the member is in the UI/UX Design Team, the function could promote them to 'Lead Designer'.")
//MARK: - Create a switch statement that gives a promotion to a member based on their team. For example, if a member is in the iOS Development Team, the function could promote them to "Senior iOS Developer" and if the member is in the UI/UX Design Team, the function could promote them to "Lead Designer".

func promote(member: String,team : Team) {
        switch team {
        case .iOS:
            let iOSArr = teamMember.filter({$0.team == "iOS Development Team"})
            print("\(member) Senior iOS Developer")
        case .Android:
            let andArr = teamMember.filter({$0.team == "Android Development Team"})
            print("\(member) Senior Android Developer")
        case .Design:
            let designArr = teamMember.filter({$0.team == "UI/UX Design Team"})
            print("\(member) Senior iOS Developer")
        }
    }

promote(member: "Mehmet Arıkan", team: .iOS)

print("**************************************************************************************************************************************")
print("Create a function that takes a team as an input and calculates the average age of the members in that team.")
//MARK: - Create a function that takes a team as an input and calculates the average age of the members in that team.

func averageAgeTeam(team: Team){
    switch team {
    case .iOS:
        var ageAverageiOS = [Int]()
        let iosAverageArr = teamMember.filter({$0.team == "iOS Development Team"})
        for i in iosAverageArr{
            ageAverageiOS.append(i.age)
        }
        let total = ageAverageiOS.reduce(0, +)
        print(total/(ageAverageiOS.count))
    case .Android:
        var ageAverageAndroid = [Int]()
        let androidAverageArr = teamMember.filter({$0.team == "Android Development Team"})
        for i in androidAverageArr{
            ageAverageAndroid.append(i.age)
        }
        let total = ageAverageAndroid.reduce(0, +)
        print(total/(ageAverageAndroid.count))
    case .Design:
        var ageAverageDesign = [Int]()
        let designAverageArr = teamMember.filter({$0.team == "UI/UX Design Team"})
        for i in designAverageArr{
            ageAverageDesign.append(i.age)
        }
        let total = ageAverageDesign.reduce(0, +)
        print(total/(ageAverageDesign.count))
    }
}

averageAgeTeam(team: .Design)

print("**************************************************************************************************************************************")
print("Create a switch statement that prints out a different message for each team, such as 'The iOS Development Team is the backbone of our academy' for the iOS Development Team and 'The UI/UX Design Team is the face of our academy' for the UI/UX Design Team.")
//MARK: - Create a switch statement that prints out a different message for each team, such as "The iOS Development Team is the backbone of our academy" for the iOS Development Team and "The UI/UX Design Team is the face of our academy" for the UI/UX Design Team.


func writerCong(team: Team){
    switch team{
    case .iOS:
        print("The iOS Development Team is the backbone of our academy")
    case .Android:
        print("A****D")
    case .Design:
        print("The UI/UX Design Team is the face of our academy")
    }
}

writerCong(team: .Android)


print("**************************************************************************************************************************************")
print("Create a function that takes a team as an input and returns an array of the contact information of all members in that team.")
//MARK: - Create a function that takes a team as an input and returns an array of the contact information of all members in that team.

func contactTeam(team: Team){
    switch team {
    case .iOS:
        let iosTeamArr = teamMember.filter({$0.team == "iOS Development Team"})
        for i in iosTeamArr{
            print("Full Name: \(i.fullName) - Phone Number: \(i.contactInformation.phoneNumber) - Email: \(i.contactInformation.email)")
        }
    case .Android:
        let androidTeamArr = teamMember.filter({$0.team == "Android Development Team"})
        for i in androidTeamArr{
            print("Full Name: \(i.fullName) - Phone Number: \(i.contactInformation.phoneNumber) - Email: \(i.contactInformation.email)")
        }
    case .Design:
        let designTeamArr = teamMember.filter({$0.team == "UI/UX Design Team"})
        for i in designTeamArr{
            print("Full Name: \(i.fullName) - Phone Number: \(i.contactInformation.phoneNumber) - Email: \(i.contactInformation.email)")
        }

    }
}

contactTeam(team: .iOS)

print("**************************************************************************************************************************************")
print("Create a switch statement that performs different actions based on the team of a member and their age. For example, if a member is in the iOS Development Team and is over 23 years old, the function could print out 'XXX member is a seasoned iOS developer', and if the member is in the UI/UX Design Team and is under 24, the function could print out 'XXX member is a rising star in the design world'.")
//MARK: - Create a switch statement that performs different actions based on the team of a member and their age. For example, if a member is in the iOS Development Team and is over 23 years old, the function could print out "XXX member is a seasoned iOS developer", and if the member is in the UI/UX Design Team and is under 24, the function could print out "XXX member is a rising star in the design world".


func filterTeamAge(team: Team, age: Int){
    switch team {
    case .iOS:
        let filteredAge = teamMember.filter({$0.age > age && $0.team == "iOS Development Team"})
        for member in filteredAge{
            print("\(member.fullName) is a seasoned iOS developer")
        }
    case .Android:
        let filteredAge = teamMember.filter({$0.age > age && $0.team == "Android Development Team"})
        for member in filteredAge{
            print("\(member.fullName) is a seasoned Android developer")
        }
    case .Design:
        let filteredAge = teamMember.filter({$0.age < age && $0.team == "UI/UX Design Team"})
        for member in filteredAge{
            print("\(member.fullName) member is a rising star in the design world")
        }
    }
}

filterTeamAge(team: .Design, age: 24)



print("********************************************************* UNWRAPPING TASK ****************************************************************************")


print("**************************************************************************************************************************************")
print("Create a function that prints out a message based on the member's motivation level. For example, if the motivation level is nil, the function should print out 'This member has no motivation level set' and if the motivation level is greater than 5, the function should print out 'This member is highly motivated'. ( You should use guard let for this task)")
//MARK: - Create a function that prints out a message based on the member's motivation level. For example, if the motivation level is nil, the function should print out "This member has no motivation level set" and if the motivation level is greater than 5, the function should print out "This member is highly motivated". ( You should use guard let for this task)


func increaseMotivation(uptadeLevel: Int){
    //if let (teamMember.filter({$0.motivationLevel == nil}))
        // if lete bak
   }
