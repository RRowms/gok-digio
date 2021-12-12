//
//  digioTests.swift
//  digioTests
//
//  Created by Cesar Nalio on 03/12/21.
//

import XCTest
@testable import digio

class digioValidateUrlTests: XCTestCase {

    var sut: ValidatorsModel?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = ValidatorsModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func test_validateUrl_empty() {
        let urlToTest = ""
        
        do {
            let answer = try sut?.validateUrl(urlString: urlToTest)
            XCTAssertEqual(answer, false)
        } catch {
            print(error)
        }
        
    }

    func test_validateUrl_invalid() {
        let urlToTest = "https://teste.com.br/%"
        
        do {
            let answer = try sut?.validateUrl(urlString: urlToTest)
            XCTAssertEqual(answer, false)
        } catch {
            print(error)
        }
        
    }

    func test_validateUrl_unsupported() {
        let urlToTest = "htttps://teste.com.br"
        
        do {
            let answer = try sut?.validateUrl(urlString: urlToTest)
            XCTAssertEqual(answer, false)
        } catch {
            print(error)
        }
        
    }

    func test_validateUrl_valid() {
        let urlToTest = "https://teste.com.br"
        
        do {
            let answer = try sut?.validateUrl(urlString: urlToTest)
            XCTAssertEqual(answer, true)
        } catch {
            print(error)
        }
        
    }

}
