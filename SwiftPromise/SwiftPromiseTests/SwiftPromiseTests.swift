/**
 The MIT License (MIT)
 Copyright (c) 2018 Rolando Asmat
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
 associated documentation files (the "Software"), to deal in the Software without restriction,
 including without limitation the rights to use, copy, modify, merge, publish, distribute,
 sublicense, and/or sell copies of the Software, and to permit persons to whom the Software
 is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or
 substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
 NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
 DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import XCTest
@testable import SwiftPromise

enum PromiseError: Error {
    case error
}

class SwiftPromiseTests: XCTestCase {
    
    func testFulFill() {
        // Create expectation
        let expect = expectation(description: "Waiting for Promise fulfillment")
        
        // Init promise
        let promise = Promise<Double>() { fulfill, reject in
            let result = 44.0
            // Fulfill the promise
            fulfill(result)
        }
        
        // React to promise
        promise.then({ (result) in
            print("Got the result!\n\(result)")
            expect.fulfill()
        }) { (error) in
            print("Got an  error :(\n\(error.localizedDescription)")
        }
        
        // Wait for expectation fulfillment
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testReject() {
        // Create expectation
        let expect = expectation(description: "Waiting for Promise rejection")
        
        // Init promise
        let promise = Promise<Double>() { fulfill, reject in
            // Reject the promise
            reject(PromiseError.error)
        }
        
        // React to promise
        promise.then({ (result) in
            print("Got the result!\n\(result)")
        }) { (error) in
            print("Got an  error :(\n\(error.localizedDescription)")
            expect.fulfill()
        }
        
        // Wait for expectation fulfillment
        waitForExpectations(timeout: 5, handler: nil)
    }
}
