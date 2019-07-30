//
//  ImageCompressor.swift
//  BusyAssertion-Article
//
//  Created by Vadym Bulavin on 7/30/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import UIKit

class ImageCompressor {
    
    let queue: DispatchQueue
    
    init(queue: DispatchQueue) {
        self.queue = queue
    }
    
    func compress(_ source: UIImage, completion: @escaping (UIImage) -> Void) {
        queue.async {
            sleep(1)
            completion(UIImage())
        }
    }
}
