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

    func testSearch() {
        let sut = MusicService()
        
        var result: Result<[Track], Error>?
        sut.search("Rock") {
            result = $0
        }
        
//        expectation(description: <#T##String#>)
    }

    func testNextPageIsShown() {
        let navController = UINavigationController()
        let sut = PagingViewController(navController: navController)
        
        sut.showNextPage(UIViewController())
        
        XCTAssertEqual(navController.viewControllers.count, 2)
    }
}


class PagingViewController {
    let navController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func showNextPage(_ nextPage: UIViewController) {
        navController.pushViewController(nextPage, animated: true)
    }
}
