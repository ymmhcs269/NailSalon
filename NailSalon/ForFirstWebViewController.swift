//
//  ForFirstWebViewController.swift
//  NailSalon
//
//  Created by 佐藤まりの on H28/08/28.
//  Copyright © 平成28年 mycompany. All rights reserved.
//

import UIKit

class ForFirstWebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    /*今のところよくわかっていない
     var url:String = "nail1.html."
    
    func loadURL() {
        let requestURL = NSURL(string: url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }
     */
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

