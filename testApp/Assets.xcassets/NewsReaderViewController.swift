//
//  NewsReaderViewController.swift
//  testApp
//
//  Created by Владислав on 26.11.2017.
//  Copyright © 2017 Владислав. All rights reserved.
//

import UIKit

class NewsReaderViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewNews: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell  = tableViewNews.dequeueReusableCell(withIdentifier: "arcCell", for: indexPath) as! ArticleTableViewCell
        
        cell.titleCell.text = "This APP"
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
