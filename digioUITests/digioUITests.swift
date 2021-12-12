//
//  digioUITests.swift
//  digioUITests
//
//  Created by Cesar Nalio on 03/12/21.
//

import XCTest

class digioUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_open_details () {
                
        let app = XCUIApplication()
        app.launch()

        let scrollViewsQuery = app.scrollViews
        let element = scrollViewsQuery.otherElements.containing(.staticText, identifier:"Produtos").children(matching: .collectionView).element(boundBy: 1).children(matching: .cell).element(boundBy: 0).children(matching: .other).element
        element.tap()
        
        let elementsQuery = scrollViewsQuery.otherElements
        let detailImageElement = elementsQuery.images["detailImageElement"]
        XCTAssertTrue(detailImageElement.exists)
        
        let detaillabelelementStaticText = elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["detailLabelElement"]/*[[".staticTexts[\"XBOX\"]",".staticTexts[\"detailLabelElement\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(detaillabelelementStaticText.exists)

        let detailtextelementTextView = elementsQuery.textViews["detailTextElement"]
        XCTAssertTrue(detailtextelementTextView.exists)
        detailtextelementTextView.tap()
        detailtextelementTextView.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Select All"]/*[[".menus",".menuItems[\"Select All\"].staticTexts[\"Select All\"]",".staticTexts[\"Select All\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Copy"]/*[[".menus",".menuItems[\"Copy\"].staticTexts[\"Copy\"]",".staticTexts[\"Copy\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["digio.Detail"].buttons["Back"].tap()

    }

}
