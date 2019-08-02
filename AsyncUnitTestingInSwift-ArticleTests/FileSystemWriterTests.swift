//
//  FileSystemWriterTests.swift
//  AsyncUnitTestingInSwift-ArticleTests
//
//  Created by Vadym Bulavin on 7/30/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import XCTest
@testable import AsyncUnitTestingInSwift_Article

class FileSystemWriterTests: XCTestCase {

    func testWriteAddsOperationsToQueue() {
        let queue = OperationQueue()
        
        let sut = FileSystemWriter(queue: queue)
        
        sut.write(Data(), to: "")
        
        XCTAssertEqual(queue.operationCount, 2)
    }
    
    func testClientIncrementsFilesCounter() {
        let client = FileSystemWriterClient()
        
        client.didFinishWriting()
        
        XCTAssertEqual(client.filesWritten, 1)
    }
}
