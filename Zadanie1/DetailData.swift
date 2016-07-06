//
//  DetailData.swift
//  Zadanie1
//
//  Created by praktykant on 06.07.2016.
//  Copyright © 2016 praktykant. All rights reserved.
//

import Foundation

class DetailData {
    
    var content: String?
    var intro: String?
    
    init(withDictionary dictionary:[String : AnyObject]) {
        
        self.content = dictionary["content"] as? String
        self.intro = dictionary["intro"] as? String
    }
    
}