//
//  digioApiManagerTests.swift
//  digioTests
//
//  Created by Cesar Nalio on 12/12/21.
//

import XCTest
@testable import digio

class digioApiManagerTests: XCTestCase {

    func test_getData_nil() {
        DigioApiManager.urlString = "https://teste.com.br"
        
        do {
            try DigioApiManager.getData(completion: { data, error in
                let data = data
                XCTAssertNil(data)
            })
        } catch {
            print(error)
        }
        
    }

    func test_getData_not_nil() {
        DigioApiManager.urlString = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products"
        
        do {
            try DigioApiManager.getData(completion: { data, error in
                let data = data
                XCTAssertNotNil(data)
            })
        } catch {
            print(error)
        }
        
    }

}
