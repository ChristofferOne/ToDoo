//
//  TodoModelTest.swift
//  To DoooTests
//
//  Created by Christoffer Lundberg on 2017-10-14.
//  Copyright © 2017 christofferlundberg. All rights reserved.
//

import XCTest

class TodoModelTest: XCTestCase {
    
    var model:TodoModel!
    
    override func setUp() {
        super.setUp()
    
        model = TodoModel()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testTodoModel() {
        model.addPending(text: "Firstitem")
        XCTAssertEqual(["Firstitem"], model.getPending())
        model.addDone(text: "Seconnditem")
        XCTAssertEqual(["Firstitem", "Seconditem"], model.getPending())
        model.addPending(text: "Thirditem")
        XCTAssertEqual(["Thirditem"], model.getDone())
        model.removeDone(index: 0)
        XCTAssertEqual([], model.getDone())
        model.removePending(index: 0)
        XCTAssertEqual(["Seconditem"], model.getPending())
        
        // Reset model
        model = TodoModel()
    }
    
    func testPerformanceTodoModel() {
        self.measure {
            model.addPending(text: "Testitem")
        }
        self.measure {
            model.addDone(text: "Testitem")
        }
        self.measure {
            model.removePending(index: 0)
        }
        self.measure {
            model.removeDone(index: 0)
        }
        
        // Reset model
        model = TodoModel()
    }
    
}
