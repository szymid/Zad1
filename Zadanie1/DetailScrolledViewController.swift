//
//  DetailScrolledViewController.swift
//  Zadanie1
//
//  Created by praktykant on 06.07.2016.
//  Copyright © 2016 praktykant. All rights reserved.
//

import UIKit

class DetailScrolledViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
   
    var listObject: ListData?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.contentSize.height = 2000
        self.scrollView.contentOffset.y = 0
    }
}
