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

class NailSalonTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    
    var postArray: [PostData] = []

    
    @IBOutlet weak var nailsalonTableView: UITableView!
    
    @IBAction func backButton(sender: AnyObject) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nailsalonTableView.delegate = self
        nailsalonTableView.dataSource = self

        
        let nib = UINib(nibName: "NailSalonTableViewCell", bundle: nil)
        nailsalonTableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        nailsalonTableView.rowHeight = UITableViewAutomaticDimension
        
        
        // 要素が追加されたらpostArrayに追加してTableViewを再表示する
        FIRDatabase.database().reference().child(CommonConst.PostPATH).observeEventType(.ChildAdded, withBlock: { snapshot in
            
            // PostDataクラスを生成して受け取ったデータを設定する
            if let uid = FIRAuth.auth()?.currentUser?.uid {
                let postData = PostData(snapshot: snapshot, myId: uid)
                self.postArray.insert(postData, atIndex: 0)
                
                // TableViewを再表示する
                self.nailsalonTableView.reloadData()
            }
        })
        
        // 要素が変更されたら該当のデータをpostArrayから一度削除した後に新しいデータを追加してTableViewを再表示する
        FIRDatabase.database().reference().child(CommonConst.PostPATH).observeEventType(.ChildChanged, withBlock: { snapshot in
            if let uid = FIRAuth.auth()?.currentUser?.uid {
                // PostDataクラスを生成して受け取ったデータを設定する
                let postData = PostData(snapshot: snapshot, myId: uid)
                
                // 保持している配列からidが同じものを探す
                var index: Int = 0
                for post in self.postArray {
                    if post.id == postData.id {
                        index = self.postArray.indexOf(post)!
                        break
                    }
                }
                
                // 差し替えるため一度削除する
                self.postArray.removeAtIndex(index)
                
                // 削除したところに更新済みのでデータを追加する
                self.postArray.insert(postData, atIndex: index)
                
                // TableViewの該当セルだけを更新する
                let indexPath = NSIndexPath(forRow: index, inSection: 0)
                self.nailsalonTableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
            }
        })
        
        func nailsalonTableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return postArray.count
        }
        
        func nailsalonTableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            // セルを取得してデータを設定する
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NailSalonTableViewCell
            cell.postData = postArray[indexPath.row]
            
            // セル内のボタンのアクションをソースコードで設定する
            cell.likeButton.addTarget(self, action:#selector(handleButton(_:event:)), forControlEvents:  UIControlEvents.TouchUpInside)
            
            
            // UILabelの行数が変わっている可能性があるので再描画させる
            cell.layoutIfNeeded()
            
            return cell
        }
        
        func nailsalonTableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            // Auto Layoutを使ってセルの高さを動的に変更する
            return UITableViewAutomaticDimension
        }
        
        func nailsalonTableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            // セルをタップされたら何もせずに選択状態を解除する
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
        
        // セル内のボタンがタップされた時に呼ばれるメソッド
        func handleButton(sender: UIButton, event:UIEvent) {
            
            // タップされたセルのインデックスを求める
            let touch = event.allTouches()?.first
            let point = touch!.locationInView(self.nailsalonTableView)
            let indexPath = nailsalonTableView.indexPathForRowAtPoint(point)
            
            // 配列からタップされたインデックスのデータを取り出す
            let postData = postArray[indexPath!.row]
            
            // Firebaseに保存するデータの準備
            if let uid = FIRAuth.auth()?.currentUser?.uid {
                if postData.isLiked {
                    // すでにいいねをしていた場合はいいねを解除するためIDを取り除く
                    var index = -1
                    for likeId in postData.likes {
                        if likeId == uid {
                            // 削除するためにインデックスを保持しておく
                            index = postData.likes.indexOf(likeId)!
                            break
                        }
                    }
                    postData.likes.removeAtIndex(index)
                } else {
                    postData.likes.append(uid)
                }
                
         
                
                
                let image = postData.image
                let name = postData.name
                let station = postData.station
                let menu1 = postData.menu1
                let menu2 = postData.menu2
                let budget = postData.budget

                
                
                //辞書を作成してFirebaseに保存する
                 let post = ["name": name!, "station": station!, "menu1": menu1!,"menu2": menu2, "budget": budget!, "image":image! ]
                
                let postRef = FIRDatabase.database().reference().child(CommonConst.PostPATH)
                postRef.child(postData.id!).setValue(post)
            }
        }


        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

    
    /*作成途中
    // Firebaseに保存するデータの準備
        let image = postData.image
        let name = postData.name
        let station = postData.station
        let menu1 = postData.menu1
        let menu2 = postData.menu2
        let budget = postData.budget
        
        //辞書を作成してFirebaseに保存する
        let post = ["name": salonNameTextField.text!, "station": stationTextField.text!, "menu1": menuTextField1.text!,"menu2": menuTextField2.text!, "budget": budgetTextField.text!, "image": nailImageView!.image!]

        let postRef = FIRDatabase.database().reference().child(CommonConst.PostPATH)
        postRef.child(postData.id!).setValue(post)
    }*/

}


