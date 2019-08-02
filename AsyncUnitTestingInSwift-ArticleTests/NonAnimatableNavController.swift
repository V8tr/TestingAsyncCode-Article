//
//  NonAnimatableNavController.swift
//  AsyncUnitTestingInSwift-ArticleTests
//
//  Created by Vadym Bulavin on 7/30/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import UIKit

class NonAnimatableNavController: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: false)
    }
}
