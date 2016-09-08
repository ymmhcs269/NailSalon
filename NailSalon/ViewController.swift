//
//  ViewController.swift
//  NailSalon
//
//  Created by 佐藤まりの on H28/08/19.
//  Copyright © 平成28年 mycompany. All rights reserved.
//

import UIKit
//必要かは不明
import Firebase
import FirebaseAuth


class ViewController: UIViewController {
    
 
        //条件から検索できる画面に遷移
    @IBAction func fromDetail(sender: AnyObject){
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewControllerWithIdentifier("FromDetail") as! FromDetailViewController
        self.presentViewController(nextView, animated: true, completion: nil)
    }
    
    
        //画像から検索できる画面に遷移
    @IBAction func fromPics(sender: AnyObject) {
        let storyboard: UIStoryboard = self.storyboard!
        //検索結果を見るための実験中
        //let nextView = storyboard.instantiateViewControllerWithIdentifier("FromPics") as! FromPicsTableViewController
        let nextView = storyboard.instantiateViewControllerWithIdentifier("NailSalon") as! NailSalonTableViewController
        self.presentViewController(nextView, animated: true, completion: nil)
    }
    
    
        //初心者のひとのためのQ&A画面に遷移）
    @IBAction func forFirst(sender: AnyObject) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewControllerWithIdentifier("ForFirst") as! ForFirstViewController
        self.presentViewController(nextView, animated: true, completion: nil)
    }
    
    
        //ネイルサロン登録画面に遷移
    @IBAction func post(sender: AnyObject) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewControllerWithIdentifier("Post") as! PostViewController
        self.presentViewController(nextView, animated: true, completion: nil)
    }
  
    

    override func viewDidLoad() {
    super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

