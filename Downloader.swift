//
//  Downloader.swift
//  Local_NotificationExample
//
//  Created by Sudhir Kumar on 10/9/15.
//  Copyright (c) 2015 Citibank. All rights reserved.
//

import Foundation




class Downloader {
    let url: NSURL
    lazy var config = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    var running = false
    
    typealias JSONArrayCompletion = (Array<AnyObject>?) -> ()
    
    init(_ url: String) {
        self.url = NSURL(string: url)!
        
    }
    
    func downloadJson(completion: JSONArrayCompletion) {
        let task = session.dataTaskWithURL(url) {
            (let data, let response, let error) in
            if let httpResponse = response as? NSHTTPURLResponse {
                println("got some data")
                switch(httpResponse.statusCode) {
                case 200:
                    println("got a 200")
                    self.parseJson(data, completion: completion)
                    
                default:
                    self.errorStatus(httpResponse, completion: completion)
                    println("Got an HTTP \(httpResponse.statusCode)")
                }
            } else {
                println("I don't know how to handle non-http responses")
            }
            
            self.running = false
        }
        
        running = true
        task.resume()
    }
    
    
    func errorStatus(httpResponseStatus: NSHTTPURLResponse, completion: JSONArrayCompletion){
        
        let dictionary = Dictionary()

        
        completion(["ERROR"])
        println("Got an HTTP \(httpResponseStatus)")
        
    }
    
    func parseJson(data: NSData, completion: JSONArrayCompletion) {
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
        println(jsonResult)
        
        completion([jsonResult])
    }
}


