//
//  RequestManager.swift
//  Zadanie1
//
//  Created by praktykant on 05.07.2016.
//  Copyright © 2016 praktykant. All rights reserved.
//

import UIKit


class RequestManager{
    
    let host = "http://umtychy.pl/api/"
    var listDataArray = [ListData]()
    
    func getNewsData(completion: (result: [ListData]?)->()) {
        
        let url = NSURL(string: "\(host)news")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            
            if data != nil {
                
                do{
                    let jsonObj = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! [String : AnyObject]
                    
                    if let newsArray = jsonObj["news"] as? NSMutableArray {
                        
                        for object in newsArray {
                            let newObject = ListData(withDictionary: object as! [String : AnyObject])
                            self.listDataArray.append(newObject)
                        }
                        dispatch_async(dispatch_get_main_queue(), {
                            completion(result: self.listDataArray)
                        })
                    }
                }catch{print(error)}
            }
            completion(result: nil)
        }
        task.resume()
    }
    
    func getDetailDataFromId(id: Int, withCompletion completion:(data: DetailData?)->()) {
        
        let url = NSURL(string: "\(host)article?id=\(id)")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            
            if data != nil {
                
                do{
                    let jsonObj = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! [String : AnyObject]
                    let newObject = DetailData(withDictionary: jsonObj)
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        completion(data: newObject)
                    })
                }catch{print(error)}
            }
        }
        task.resume()
    }
    
    func loadImageFromUrl(url: String, withCompletion completion:(image: UIImage) ->()) {
        
        let imgUrl = NSURL(string: url)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(imgUrl!) { (responseData, responseUrl, error) -> Void in
            if let data = responseData{
                let image = UIImage(data: data)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    completion(image: image!)
                })
            }
        }
        task.resume()
    }
}
