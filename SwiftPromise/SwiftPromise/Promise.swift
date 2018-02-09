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

import Foundation

/// A basic, easy to use, Promise.
class Promise<T> {
    typealias EmptyClosure = () -> Void
    
    /// Closure with 2 closures as input, one to fulfill the promise and the other to reject it.
    typealias PromiseCallback = (Fulfill, Reject) -> Void
    
    /// Closure that fulfills the promise, pass in result <T> to fulfill.
    typealias Fulfill = (T) -> Void
    
    /// Closure that rejects the promise, pass an error to reject.
    typealias Reject = (Error) -> Void
    
    private var callback: PromiseCallback
    private var settled: Bool = false
    
    /**
     Create a Promise.
     
     ## Sample init
     ```
     /// Initialize the promise
     let promise = Promise<Double>() { fulfill, reject in
        /// Perform some operation in order to settle promise...
        let result = 44.0
     
        /// Fulfill promise
        fulfill(result)
     }
     ```
     
     - parameter callback: The Promise Callback closure, fulfill or reject the promise here.
     */
    init(_ callback: @escaping PromiseCallback) {
        self.callback = callback
    }
    
    /**
     Do something after the Promise has been fulfilled or rejected
     
     - parameter fulfill: Fulfill closure, do something with the result.
     - parameter reject: Reject closure, do something with the error.
     */
    func then(_ fulfill: @escaping Fulfill, _ reject: @escaping Reject) {
        let _fullfill: Fulfill = { result in
            if !self.settled {
                fulfill(result)
                self.settled = true
            }
        }
        let _reject: Reject = { error in
            if !self.settled {
                reject(error)
                self.settled = true
            }
        }
        callback(_fullfill, _reject)
    }
}
