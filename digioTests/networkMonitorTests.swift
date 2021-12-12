//
//  networkMonitorTests.swift
//  digioTests
//
//  Created by Cesar Nalio on 12/12/21.
//

import XCTest
@testable import digio

class networkMonitorTests: XCTestCase {

    var sut: NetworkMonitor?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = NetworkMonitor()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func test_isconnected_true() {
        let answer = NetworkMonitor.shared.isConnected
        XCTAssertEqual(answer, Optional(true))
        NetworkMonitor.shared.stopMonitoring()
    }

    func test_isconnected_false() {
        sut?.stopMonitoring()
        let answer = sut?.isConnected
        XCTAssertEqual(answer, Optional(false))
    }

}
