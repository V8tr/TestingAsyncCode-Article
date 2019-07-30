//
//  MusicServiceTests.swift
//  BusyAssertion-ArticleTests
//
//  Created by Vadym Bulavin on 7/29/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import XCTest
@testable import BusyAssertion_Article

class MusicServiceTests: XCTestCase {

    func testSearchUsingSignaling() {
        let didFinish = self.expectation(description: #function)
        var result: Result<[Track], Error>?
        
        let sut = MusicService()

        sut.search("Rock") {
            result = $0
            didFinish.fulfill()
        }
        
        wait(for: [didFinish], timeout: 5)
        
        XCTAssertNoThrow(try result?.get())
    }
}
