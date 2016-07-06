//
//  ListData.swift
//  Zadanie1
//
//  Created by praktykant on 05.07.2016.
//  Copyright © 2016 praktykant. All rights reserved.
//

import UIKit

class ListData: NSObject {
    
    var id:Int
    var date:String
    var imageUrl:String
    var title: String
    
    init(id: Int, date: String, imgUrl: String, title: String) {
        
        self.date = date
        self.id = id
        self.imageUrl = imgUrl
        self.title = title
    }
    
    init(withDictionary dictionary: [String : AnyObject]) {
        let idNumber = dictionary["id"] as! String
        self.id = Int(idNumber)!
        self.date = dictionary["date"]! as! String
        self.imageUrl = dictionary["thumb"]! as! String
        self.title = dictionary["title"]! as! String
    }
}
