
let numbers = [1, 1, 1, 1, 1, 10, 20]

func averageNumber(number: [Int]){
    
    var countArr = number.count
    var totalNumber = 0
    
    for num in number{
        totalNumber += num
    }
    var overageNumber = totalNumber/countArr
    print(overageNumber)

    let patlayan = "💣"
    let ates = "🔥"

    for row in 0..<overageNumber {
        for col in 0..<overageNumber {
            if row == 0 || row == overageNumber - 1 || col == 0 || col == overageNumber - 1 {

                print(patlayan, terminator: "")
            } else {

                print(ates, terminator: "")
            }
        }
        print()
    }
}

averageNumber(number: numbers)



