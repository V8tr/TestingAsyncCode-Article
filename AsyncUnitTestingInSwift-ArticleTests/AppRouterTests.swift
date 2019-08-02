//
//  AppRouterTests.swift
//  AsyncUnitTestingInSwift-ArticleTests
//
//  Created by Vadym Bulavin on 7/30/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import XCTest
@testable import AsyncUnitTestingInSwift_Article

class AppRouterTests: XCTestCase {

    func testShowsTwoScreens() {
        let navController = NonAnimatableNavController()
        let firstScreen = UIViewController()
        let secondScreen = UIViewController()
        
        let sut = AppRouter(navController: navController)
        
        sut.routeTo(firstScreen)
        sut.routeTo(secondScreen)
        
        XCTAssertEqual(navController.viewControllers.count, 2)
        XCTAssertEqual(navController.viewControllers.first, firstScreen)
        XCTAssertEqual(navController.viewControllers.last, secondScreen)
    }
}
