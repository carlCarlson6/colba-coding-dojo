//
//  main.swift
//  BankOcr
//
//  Created by Juanjo Martí on 12/6/23.
//

import Foundation

main()

func main(){
    print("Hello, Kata")
    
    let numberZero: String = " _ " +
                             "| |" +
                             "|_|"
    
    let bankAccount: String =
    " _  _  _  _  _  _  _  _  _" +
    "| || || || || || || || || |" +
    "|_||_||_||_||_||_||_||_||_|"
    
    parserBankAccount(bankAccount: bankAccount)
    
    let test = parserZeroNumber(number: numberZero)
    print(test)
}

func parserBankAccount(bankAccount: String) -> String {
    
    var accountFirstLine: String = ""
    var accountSecondLine: String = ""
    var accountThirdLine: String = ""
    
    accountFirstLine = bankAccount.split(every: 9)[0]
    accountSecondLine = bankAccount.split(every: 9)[1]
    accountThirdLine = bankAccount.split(every: 9)[2]
    
    for i in 0 ... 8{
        var index = 
    }
    
    let firstNumber = accountFirstLine[0]+accountFirstLine[1]+accountFirstLine[2]
    
    
    return ""
}

func parserZeroNumber(number: String) -> Int?{
    if number.count == 9 {
        switch number {
        case Numbers.NUMBER0.rawValue: return 0
        case Numbers.NUMBER1.rawValue: return 1
        case Numbers.NUMBER2.rawValue: return 2
        case Numbers.NUMBER3.rawValue: return 3
        case Numbers.NUMBER4.rawValue: return 4
        case Numbers.NUMBER5.rawValue: return 5
        case Numbers.NUMBER6.rawValue: return 6
        case Numbers.NUMBER7.rawValue: return 7
        case Numbers.NUMBER8.rawValue: return 8
        case Numbers.NUMBER9.rawValue: return 9
        default: return nil
        }
    }
    return nil
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
}
