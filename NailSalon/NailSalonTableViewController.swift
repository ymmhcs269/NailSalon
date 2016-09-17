//
//  NailSalonTableViewController.swift
//
//
//  Created by 佐藤まりの on H28/08/25.
//
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class NailSalonTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var page_num2 = 0
    var postArray: [PostData] = []
    var checkPriceRange = 0
    
    
    //データの一時格納
    var minPrice:String = ""
    var maxPrice:String = ""
    var nearStation:String = ""
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backButton(sender: AnyObject) {
        // 画面を閉じる
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "NailSalonTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func viewWillAppear(animated:Bool){
        super.viewWillAppear(animated)
        
        print(self.minPrice)
        
        self.postArray = []
        
        
        // 要素が追加されたらpostArrayに追加してTableViewを再表示する
        FIRDatabase.database().reference().child(CommonConst.PostPATH).observeEventType(.ChildAdded, withBlock: { snapshot in
            
            //self.postArray = []
            
            // PostDataクラスを生成して受け取ったデータを設定する
            let postData = PostData(snapshot: snapshot)
            
            if (self.nearStation == "") {
                // var budget_price:Int = Int
                if (self.minPrice == "" && self.maxPrice == ""){
                    self.postArray.insert(postData, atIndex: 0)
                }
                else if (self.minPrice == "" && self.maxPrice != ""){
                    if (Int(postData.budget!) < Int(self.maxPrice)!){
                        self.postArray.insert(postData, atIndex: 0)
                    }
                }
                else if (self.minPrice != "" && self.maxPrice == ""){
                    if (Int(postData.budget!) > Int(self.minPrice)!){
                        self.postArray.insert(postData, atIndex: 0)
                    }
                }
                else if (self.minPrice != "" && self.maxPrice != ""){
                    if (Int(postData.budget!) < Int(self.maxPrice)! && Int(postData.budget!) > Int(self.minPrice)!) {
                        self.postArray.insert(postData, atIndex: 0)
                    }
                }
                
                
                
            }else{
                if(postData.station == self.nearStation){
                    if (self.minPrice == "" && self.maxPrice == ""){
                        self.postArray.insert(postData, atIndex: 0)
                    }
                    else if (self.minPrice == "" && self.maxPrice != ""){
                        if (Int(postData.budget!) < Int(self.maxPrice)!){
                            self.postArray.insert(postData, atIndex: 0)
                        }
                    }
                    else if (self.minPrice != "" && self.maxPrice == ""){
                        if (Int(postData.budget!) > Int(self.minPrice)!){
                            self.postArray.insert(postData, atIndex: 0)
                        }
                    }
                    else if (self.minPrice != "" && self.maxPrice != ""){
                        if (Int(postData.budget!) < Int(self.maxPrice)! && Int(postData.budget!) > Int(self.minPrice)!) {
                            self.postArray.insert(postData, atIndex: 0)
                        }
                    }
                    
                }
            }
            
            
            /*
             if (self.checkPriceRange( Int(self.minPrice)!, MaxPrice:Int(self.maxPrice)!, Budget:Int(postData.budget!)!)){
             self.postArray.insert(postData, atIndex: 0)
             }*/
            
            
            // TableViewを再表示する
            self.tableView.reloadData()
        })
        
        
        // 要素が変更されたら該当のデータをpostArrayから一度削除した後に新しいデータを追加してTableViewを再表示する
        FIRDatabase.database().reference().child(CommonConst.PostPATH).observeEventType(.ChildChanged, withBlock: { snapshot in
            
            // self.postArray = []
            // self.postArray.removeAll()
            
            // PostDataクラスを生成して受け取ったデータを設定する
            let postData = PostData(snapshot: snapshot)
            
            // 保持している配列からidが同じものを探す
            var index: Int = 0
            for post in self.postArray {
                if post.id == postData.id {
                    index = self.postArray.indexOf(post)!
                    break
                }
            }
            
            // 差し替えるため一度削除する
            //self.postArray = []
            //self.postArray.removeAll()
            //self.postArray = []
            //self.postArray.removeAtIndex(index)
            
            // 削除したところに更新済みのでデータを追加する
            self.postArray.insert(postData, atIndex: index)
            
            // TableViewの該当セルだけを更新する
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
            self.tableView.reloadData()
            
        })
    }
    
    //セルの個数を指定するデリゲードメソッッド
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    //セルに値を設定するデータソースメソッド
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // セルを取得してデータを設定する
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NailSalonTableViewCell
        cell.setPostData(postArray[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        // Auto Layoutを使ってセルの高さを動的に変更する
        return UITableViewAutomaticDimension
    }
    
    
    
    // セル内のボタンがタップされた時に呼ばれるメソッド
    func handleButton(sender: UIButton, event:UIEvent) {
        
        // タップされたセルのインデックスを求める
        let touch = event.allTouches()?.first
        let point = touch!.locationInView(self.tableView)
        let indexPath = tableView.indexPathForRowAtPoint(point)
        
        // 配列からタップされたインデックスのデータを取り出す
        let postData = postArray[indexPath!.row]
        
        
        // Firebaseに保存するデータの準備
        
        let image = postData.image
        let name = postData.name
        let station = postData.station
        let menu1 = postData.menu1
        let menu2 = postData.menu2
        let budget = postData.budget
        let url = postData.url
        
        
        
        //辞書を作成してFirebaseに保存する
        let post = ["name": name!, "station": station!, "menu1": menu1!,"menu2": menu2!, "budget": budget!, "image":image!, "url":url!]
        
        let postRef = FIRDatabase.database().reference().child(CommonConst.PostPATH)
        postRef.child(postData.id!).setValue(post)
        
    }
    
    
    
    
    // Cell が選択された場合
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        page_num2 = indexPath.row
        // SubViewController へ遷移するために Segue を呼び出す
        performSegueWithIdentifier("toResult",sender: self)
    }
    
    
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResult") {
            let resultViewController:ResultViewController = (segue.destinationViewController as? ResultViewController)!
            resultViewController.postArray = postArray[page_num2]
            resultViewController.page_num = page_num2
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}


