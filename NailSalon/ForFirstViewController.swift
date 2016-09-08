//
//  ForFirstViewController.swift
//  NailSalon
//
//  Created by 佐藤まりの on H28/08/25.
//  Copyright © 平成28年 mycompany. All rights reserved.
//


import UIKit

class ForFirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
   //テーブルビューの内容
    let html = ["ソフトジェルとハードジェルの違い","ジェルネイルの保ち","みんながお店を決めるときのこだわり","ジェルネイルとは？？","爪に対しての負担は大丈夫？？","スカルプって何？？","ジェルネイルのオフ","ジェルネイルを長持ちさせるために","マットネイルとは","爪が短いけど大丈夫？","家でジェルネイルをすることは可能？"]
    
    //var count = 0
    
    @IBOutlet weak var forFirstTableView: UITableView!
    
    @IBAction func backButton(sender: AnyObject) {
        // 画面を閉じる
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// セルの個数を指定するデリゲートメソッド
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return html.count
    }
    
    /// セルに値を設定するデータソースメソッド
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)

        // セルに表示する値を設定する
        cell.textLabel!.text = html[indexPath.row]
        return cell
    }
    
    // Cell が選択された場合
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // SubViewController へ遷移するために Segue を呼び出す
        performSegueWithIdentifier("toForFirstWeb",sender: self)
    }
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toForFirstWeb") {
            let forFirstWebViewController:ForFirstWebViewController = (segue.destinationViewController as? ForFirstWebViewController)!
            //forFirstWebViewController.count = html[count]
        }
             }

    
    }



