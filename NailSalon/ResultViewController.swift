//
//  ResultViewController.swift
//  NailSalon
//
//  Created by 佐藤まりの on H28/08/25.
//  Copyright © 平成28年 mycompany. All rights reserved.
//


import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import TTTAttributedLabel


class ResultViewController: UIViewController,UITextViewDelegate,TTTAttributedLabelDelegate{
    
    var count2 = 0
    var postArray:PostData!
    var page_num = 0
    
    @IBOutlet weak var nailImageView: UIImageView!
    @IBOutlet weak var stationLabel: UILabel!
    @IBOutlet weak var menuLabel1: UILabel!
    @IBOutlet weak var menuLabel2: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet var urlLabel: TTTAttributedLabel!

  
    
    @IBAction func backButton(sender: AnyObject) {
        // 画面を閉じる
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // urlをリンクにする設定
        self.urlLabel.enabledTextCheckingTypes = NSTextCheckingType.Link.rawValue
        
        // 通常のUILabelとおなじようにプロパティを設定できる
        //self.urlLabel.font = UIFont.systemFontOfSize(14)
        
        //urlをタップされたときになにか処理する場合(Webビューやブラウザを起動したり)
        self.urlLabel.delegate = self
        
        //self.view.addSubView(self.urlLabel)

        
            }
    
   
    override func viewWillAppear(animated:Bool){
        super.viewWillAppear(animated)
        // 要素が追加されたらpostArrayに追加してTableViewを再表示する
       /* FIRDatabase.database().reference().child(CommonConst.PostPATH).observeEventType(.ChildAdded, withBlock: { snapshot in
            
            // PostDataクラスを生成して受け取ったデータを設定する
            let postData = PostData(snapshot: snapshot)
            //self.postArray.insert(postData, atIndex: 0)
            self.postArray.insert(postData, atIndex: self.page_num)
            
            
            print(postData.budget)
            print(postData.station)
            print(postData.menu1)
            print(postData.menu2)
            
            self.nailImageView.image = postData.image
            self.stationLabel.text = "\(postData.station!)"
            self.budgetLabel.text = "\(postData.budget!)"
            self.nameLabel.text = "\(postData.name!)"
            self.stationLabel.text = "\(postData.station!)"
            self.menuLabel1.text =  "\(postData.menu1!)"
            self.menuLabel2.text =  "\(postData.menu2!)"
            self.urlLabel.text =  "\(postData.url!)"
                    
        })*/
        
        self.nailImageView.image = self.postArray.image
        self.stationLabel.text = "\(self.postArray.station!)"
        self.budgetLabel.text = "\(self.postArray.budget!)"
        self.nameLabel.text = "\(self.postArray.name!)"
        self.stationLabel.text = "\(self.postArray.station!)"
        self.menuLabel1.text =  "\(self.postArray.menu1!)"
        self.menuLabel2.text =  "\(self.postArray.menu2!)"
        self.urlLabel.text =  "\(self.postArray.url!)"

    }
    
    //URLをクリックできるように設定(まだページへと飛ぶようにはできていない)
    func attributedLabel(label: TTTAttributedLabel!, didSelectLinkWithURL url: NSURL!) {
       
	}

    
 

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


