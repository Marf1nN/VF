//
//  WebViewController.swift
//  testApp
//
//  Created by Владислав on 22.11.2017.
//  Copyright © 2017 Владислав. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    var url : String?
    @IBOutlet weak var webview: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview.loadRequest(URLRequest(url: URL(string: url!)!))
       
    }

   

}
