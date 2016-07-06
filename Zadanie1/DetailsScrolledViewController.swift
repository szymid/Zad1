//
//  DetailsScrolledViewController.swift
//  Zadanie1
//
//  Created by praktykant on 06.07.2016.
//  Copyright © 2016 praktykant. All rights reserved.
//

import UIKit

class DetailsScrolledViewController: UIViewController, UIScrollViewDelegate {
    
    //@IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!
    
    var listObject: ListData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //scrollView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
       
       
    }
}
