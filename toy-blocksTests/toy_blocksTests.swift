//
//  toy_blocksTests.swift
//  toy-blocksTests
//
//  Created by James Rhodes on 7/13/20.
//  Copyright © 2020 James Rhodes. All rights reserved.
//

import XCTest
@testable import toy_blocks

class toy_blocksTests: XCTestCase {
    
    var networkingManager: NetworkingManager!
    var controller: TableViewViewController!
    var expectation: XCTestExpectation!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: config)
        networkingManager = NetworkingManager(session: session)
        expectation = XCTestExpectation(description: "Expec")
        
        controller = TableViewViewController()
        let node = Node(url: "https://thawing-springs-53971.herokuapp.com", name: "Thawing Springs")
        node.blocks = [Block(id: "1", data: "block_1"), Block(id: "2", data: "block_2"), Block(id: "3", data: "block_3")]
        controller.tableViewData = [node]
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testOpenBlocksCount() {
        let node = controller.tableViewData[0]
        node.open = true
        let rowsCount = controller.getNumberOfRows(section: 0)
        XCTAssertEqual(rowsCount, 4, "Correct count")
    }
    
    func testClosedBlocksCount() {
        let node = controller.tableViewData[0]
        node.open = false
        let rowsCount = controller.getNumberOfRows(section: 0)
        XCTAssertNotEqual(rowsCount, 4, "Incorrect count")
    }
    
    func testSuccessfulResponse() {
        let root = Root(data: [BlockData(id: "3", type: "block", attributes: AttributeData(index: 1, timestamp: 123242423, data: "Hello world", hash: "ewuyfgdvj"))])
        let data = try! JSONEncoder().encode(root)
        
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url else { return (HTTPURLResponse(), nil) }
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        
        networkingManager.getData(url: "https://thawing-springs-53971.herokuapp.com") { result in
            switch result {
            case .success(let root):
                XCTAssertEqual(root.data[0].id, "3", "Network fetch successful")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
}
