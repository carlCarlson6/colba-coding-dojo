//
//  main.swift
//  BankOcr
//
//  Created by Juanjo Martí on 12/6/23.
//

import Foundation

main()

func main(){
    let numb1 = "    _  _     _  _  _  _  _ " +
                "  | _| _||_||_ |_   ||_||_|" +
                "  ||_  _|  | _||_|  ||_| _|"
    
    let numb2 = " _  _  _  _  _  _  _  _  _ " +
                "|_ |_ |_ |_ |_ |_ |_ |_ |_ " +
                " _| _| _| _| _| _| _| _| _|"

    let numb3 = "    _  _     _  _  _  _  _ " +
                "  | _| _||_||_ |_   ||_|| |" +
                "  ||_  _|  | _||_|  ||_| _|"
    
    let numbers = [ numb1, numb2, numb3 ]
    
    numbers.forEach { number in
        let accountNumber = parseBankAccount(bankAccount: number)
        let checksum = checkSumCheck(bankAccount: accountNumber)
        print(accountNumber, checksum)
    }
}

func parseBankAccount(bankAccount: String) -> String {
    var numbers: [String] = []
    let aux = bankAccount.split(every: 3)
    for i in 0...8 {
        numbers.append(aux[i] + aux[i+9] + aux[i+18])
    }
    
    return numbers.map { number in
        return parseNumber(number: number)
    }.joined(separator: "")
}

func checkSumCheck(bankAccount: String) -> String {
    if checkLegalNumber(bankAccount: bankAccount) {
        let reversed = String(bankAccount.reversed())
        var result = 0
        for (i, char)  in reversed.enumerated() {
            result = result + (char.wholeNumberValue ?? 0) * (i+1)
        }
        
        return result % 11 != 0 ? "ERR" : ""
    }
    return "ILL"
}

func checkLegalNumber(bankAccount: String) -> Bool {
    return !bankAccount.contains("?")
}


func getAltNumbers(number: String) -> [String] {
    let chars = [" ", "|", "_"]
    var result: [String] = []
    for (i, _) in number.enumerated() {
        for alt in chars {
            let number = parseNumber(number: String(number.prefix(i)) + alt + number.dropFirst(i+1))
            if number != "?" {
                result.append(number)
            }
                
        }
    }
    return result
}

func parseNumber(number: String) -> String{
    if number.count == 9 {
        switch number {
        case Numbers.NUMBER0.rawValue: return "0"
        case Numbers.NUMBER1.rawValue: return "1"
        case Numbers.NUMBER2.rawValue: return "2"
        case Numbers.NUMBER3.rawValue: return "3"
        case Numbers.NUMBER4.rawValue: return "4"
        case Numbers.NUMBER5.rawValue: return "5"
        case Numbers.NUMBER6.rawValue: return "6"
        case Numbers.NUMBER7.rawValue: return "7"
        case Numbers.NUMBER8.rawValue: return "8"
        case Numbers.NUMBER9.rawValue: return "9"
        default: return "?"
        }
    }
    return "?"
}

enum Numbers: String {
    case NUMBER0 = " _ | ||_|"
    case NUMBER1 = "     |  |"
    case NUMBER2 = " _  _||_ "
    case NUMBER3 = " _  _| _|"
    case NUMBER4 = "   |_|  |"
    case NUMBER5 = " _ |_  _|"
    case NUMBER6 = " _ |_ |_|"
    case NUMBER7 = " _   |  |"
    case NUMBER8 = " _ |_||_|"
    case NUMBER9 = " _ |_| _|"
}


extension String {
    /// Splits a string into groups of `every` n characters, grouping from left-to-right by default. If `backwards` is true, right-to-left.
    public func split(every: Int, backwards: Bool = false) -> [String] {
        var result = [String]()

        for i in stride(from: 0, to: self.count, by: every) {
            switch backwards {
            case true:
                let endIndex = self.index(self.endIndex, offsetBy: -i)
                let startIndex = self.index(endIndex, offsetBy: -every, limitedBy: self.startIndex) ?? self.startIndex
                result.insert(String(self[startIndex..<endIndex]), at: 0)
            case false:
                let startIndex = self.index(self.startIndex, offsetBy: i)
                let endIndex = self.index(startIndex, offsetBy: every, limitedBy: self.endIndex) ?? self.endIndex
                result.append(String(self[startIndex..<endIndex]))
            }
        }

        return result
    }
    
    subscript(_ n: Int) -> Character {
        get {
            let idx = self.index(startIndex, offsetBy: n)
            return self[idx]
        }
        set {
            let idx = self.index(startIndex, offsetBy: n)
            self.replaceSubrange(idx...idx, with: [newValue])
        }
    }
}
