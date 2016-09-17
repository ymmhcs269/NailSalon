//
//  FromPicsTableViewController.swift
//  NailSalon
//
//  Created by 佐藤まりの on H28/08/25.
//  Copyright © 平成28年 mycompany. All rights reserved.
//


import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class FromPicsTableViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var postArray: [PostData] = []
    var imageView = UIImageView()
    var selectImage:UIImage?
    var page_num3 = 0
    var label = UILabel()
    
    
            
    @IBAction func backButton(sender: AnyObject) {
        // 画面を閉じる
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
    super.viewDidLoad()
        
        //必要かは今のところ不明
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewWillAppear(animated:Bool){
        super.viewWillAppear(animated)
        // 要素が追加されたらpostArrayに追加してTableViewを再表示する
        FIRDatabase.database().reference().child(CommonConst.PostPATH).observeEventType(.ChildAdded, withBlock: { snapshot in
            
            // PostDataクラスを生成して受け取ったデータを設定する
            let postData = PostData(snapshot: snapshot)
            self.postArray.insert(postData, atIndex: 0)
            
            self.collectionView.reloadData()
            
        })
        
    }
    
    //セルの個数を指定するデリゲードメソッッド
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //登録件数分表示するように設定
        return postArray.count
    }



    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{

        // dequeueReusableCellWithReuseIdentifier の働きは
        // 再利用できるセルがあればそれを使う
        // 再利用できるセルがなければ生成する
        // Cell はストーリーボードで設定したセルのID
        let cell:UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as UICollectionViewCell
        //cell.setPostData(postArray[indexPath.row])

        
        // Tag番号を使ってImageViewのインスタンス生成
       self.imageView = cell.contentView.viewWithTag(1) as! UIImageView
        // 画像配列の番号で指定された要素の名前の画像をUIImageとする
        let cellImage = postArray[indexPath.row].image! as UIImage
        //UIImageをUIImageViewのimageとして設定
        self.imageView.image = cellImage
        
        // Tag番号を使ってLabelのインスタンス生成
        self.label = cell.contentView.viewWithTag(2) as! UILabel
        label.text = postArray[indexPath.row].name
        return cell
    }
    
    
    // Screenサイズに応じたセルサイズを返す
    // UICollectionViewDelegateFlowLayoutの設定が必要
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width: CGFloat = view.frame.width / 2 - 2
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }

        //section 数の設定、今回は１つにセット
        func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            return 1
        }
    
    
    // Cell が選択された場合
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        page_num3 = indexPath.row
        // [indexPath.row] から画像名を探し、UImage を設定
        //selectImage = postArray[indexPath.row].image! as UIImage
        //if selectImage != nil {
        // SubViewController へ遷移するために Segue を呼び出す
        performSegueWithIdentifier("toResult",sender: nil)
       // }
    }
    
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResult") {
            let resultViewController:ResultViewController = (segue.destinationViewController as? ResultViewController)!
            resultViewController.postArray = postArray[page_num3]
            resultViewController.page_num = page_num3
        }
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


