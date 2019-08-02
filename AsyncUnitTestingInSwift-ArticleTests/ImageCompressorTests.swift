//
//  ImageCompressorTests.swift
//  AsyncUnitTestingInSwift-ArticleTests
//
//  Created by Vadym Bulavin on 7/30/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import XCTest
@testable import AsyncUnitTestingInSwift_Article

class ImageCompressorTests: XCTestCase {

    func testCompressCompletes() {
        let queue = DispatchQueue(label: #function)
        let sut = ImageCompressor(queue: queue)
        
        var didCompress = false
        
        sut.compress(UIImage()) { _ in
            didCompress = true
        }
        
        queue.sync {}
        
        XCTAssertTrue(didCompress)
    }

}
