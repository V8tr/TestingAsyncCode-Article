//
//  AppRouter.swift
//  AsyncUnitTestingInSwift-Article
//
//  Created by Vadym Bulavin on 7/30/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import UIKit

class AppRouter {
    let navController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func routeTo(_ next: UIViewController) {
        navController.pushViewController(next, animated: true)
    }
}
