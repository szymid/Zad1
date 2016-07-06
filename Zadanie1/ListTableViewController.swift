//
//  ListTableViewController.swift
//  Zadanie1
//
//  Created by praktykant on 05.07.2016.
//  Copyright © 2016 praktykant. All rights reserved.
//

import UIKit

class ListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let requestManager = RequestManager()
    var listDataArray:[ListData]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate  = self
        self.tableView.dataSource = self
        self.requestManager.getNewsData { (result) in
            if let array = result {
                self.tableView.reloadData()
               self.listDataArray = array
            }
        }
    }
    
    //MARK: - Table View Data Source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.requestManager.listDataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "ListCell"
        let cell = self.tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! ListTableViewCell
        cell.selectionStyle = .None
        
        
        let listObject = self.listDataArray![indexPath.row]
        let rm = RequestManager()
        rm.loadImageFromUrl(listObject.imageUrl) { (image) in
            cell.photoImageView?.image = image
        }
        cell.dateLabel.text = listObject.date
        cell.titleLabel.text = listObject.title
        
       return cell
    }
    
    //MARK: - Table View Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("DetailsScrolled", sender: self.listDataArray![indexPath.row])
        
    }
    
    //MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.isKindOfClass(DetailScrolledViewController) {
            if segue.identifier == "DetailsScrolled" {
                
                let vc = segue.destinationViewController as! DetailScrolledViewController
                let listObject = sender as! ListData
                let id = (listObject.id)
                let requestManager = RequestManager()
        
                requestManager.loadImageFromUrl(listObject.imageUrl, withCompletion: { (image) in
                    vc.imageView.image = image
                })
                requestManager.getDetailDataFromId(id) { (data) in
                   
                    vc.contentLabel.text = data?.content
                    vc.introLabel.text = data?.intro
                    vc.titleLabel.text =  listObject.title
                    //vc.webView.loadHTMLString((data?.content)!, baseURL: nil)
                }
            }
            else if segue.identifier == "Details" {
                
                let vc = segue.destinationViewController as! DetailScrolledViewController
                let listObject = sender as! ListData
                let id = (listObject.id)
                let requestManager = RequestManager()
                
                requestManager.loadImageFromUrl(listObject.imageUrl, withCompletion: { (image) in
                    vc.imageView.image = image
                })
                requestManager.getDetailDataFromId(id) { (data) in
                    
                    vc.contentLabel.text = data?.content
                    vc.introLabel.text = data?.intro
                    vc.titleLabel.text =  listObject.title
                    //vc.webView.loadHTMLString((data?.content)!, baseURL: nil)
                }
            }
        }
    }
}
