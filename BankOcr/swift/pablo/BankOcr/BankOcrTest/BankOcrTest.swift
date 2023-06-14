//
//  BankOcrTest.swift
//  BankOcrTest
//
//  Created by Juanjo Martí on 12/6/23.
//

import XCTest

final class BankOcrTest: XCTestCase {

    func testZeroAccountNumber() throws {
        // GIVEN
        let bankAccount: String =   " _  _  _  _  _  _  _  _  _ " +
                                    "| || || || || || || || || |" +
                                    "|_||_||_||_||_||_||_||_||_|"
        // WHEN
        let account = parseBankAccount(bankAccount: bankAccount)
        
        // THEN
        XCTAssertEqual("000000000",account)
    }
    
    func test123456789AccountNumber() throws {
        // GIVEN
        let bankAccount: String = "    _  _     _  _  _  _  _ " +
                                  "  | _| _||_||_ |_   ||_||_|" +
                                  "  ||_  _|  | _||_|  ||_| _|"

        // WHEN
        let account = parseBankAccount(bankAccount: bankAccount)
        
        // THEN
        XCTAssertEqual("123456789",account)
        
    }
    func testCheckSumError(){
        // GIVEN
        let bankAccount: String = "457508001"

        // WHEN
        let status = checkSumCheck(bankAccount: bankAccount)
        
        // THEN
        XCTAssertEqual("ERR", status)
    }
    
    func testCheckSum(){
        // GIVEN
        let bankAccount: String = "457508000"

        // WHEN
        let status = checkSumCheck(bankAccount: bankAccount)
        
        // THEN
        XCTAssertEqual("", status)
    }
    
    func testCheckSumIllegal(){
        // GIVEN
        let bankAccount: String = "45750?000"

        // WHEN
        let status = checkSumCheck(bankAccount: bankAccount)
        
        // THEN
        XCTAssertEqual("ILL", status)
    }
    
    func testGetAllAltNumbers(){
        // GIVEN
        let number: String =    " _ " +
                                "|_|" +
                                "  |"

        // WHEN
        let result = getAltNumbers(number: number)
        
        // THEN
        XCTAssertEqual(result.contains("4"), true)
        XCTAssertEqual(result.contains("9"), true)
    }
    
    func testGetAllAltNumbersError(){
        // GIVEN
        let number: String =    " _ " +
                                "|_|" +
                                "| |"

        // WHEN
        let result = getAltNumbers(number: number)
        
        // THEN
        XCTAssertEqual(result.contains("0"), false)
    }
}
