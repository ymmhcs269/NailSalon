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
    @IBAction func backButton(sender: AnyObject) {
        // 画面を閉じる
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //urlの番号を決めるための変数
    var count = 0
    //urlを指定して表示させるための変数
    var targetURL = NSBundle.mainBundle().pathForResource("nail1", ofType: "html");
   
        override func viewDidLoad() {
        super.viewDidLoad()
    //指定したページを表示させる方法
    if (count >= 0 && count < 10 ){
        targetURL = NSBundle.mainBundle().pathForResource(String(format: "nail%d", count + 1), ofType: "html")
    }
    loadAddressURL()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadAddressURL() {
        let requestURL = NSURL(string: targetURL!)
        let req = NSURLRequest(URL: requestURL!)
        webView.loadRequest(req)
    }

    
    
}

