//
//  FileSystemWriter.swift
//  BusyAssertion-Article
//
//  Created by Vadym Bulavin on 7/30/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import Foundation

protocol FileSystemWriterDelegate: AnyObject {
    func didFinishWriting()
}

class FileSystemWriter {
    
    weak var delegate: FileSystemWriterDelegate?

    private let queue: OperationQueue
    
    init(queue: OperationQueue) {
        self.queue = queue
    }
    
    func write(_ data: Data, to path: String) {
        let doWrite = BlockOperation { sleep(1) }
        
        let notifyDelegate = BlockOperation { [weak self] in self?.delegate?.didFinishWriting() }
        notifyDelegate.addDependency(doWrite)
        
        queue.addOperations([doWrite, notifyDelegate], waitUntilFinished: false)
    }
}

class FileSystemWriterClient: FileSystemWriterDelegate {
    
    var filesWritten = 0
    
    func didFinishWriting() {
        filesWritten += 1
    }
}
