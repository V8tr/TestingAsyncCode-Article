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
        let targetViewController = UIViewController()
        
        let sut = PagingViewController(navController: navController)
        
        sut.showNextPage(targetViewController)
        
        XCTAssertEqual(navController.viewControllers.count, 1)
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

class NonAnimatableNavController: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: false)
    }
}
