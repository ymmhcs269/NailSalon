//
//  FromDetailViewController.swift
//  NailSalon
//
//  Created by 佐藤まりの on H28/08/25.
//  Copyright © 平成28年 mycompany. All rights reserved.
//


import UIKit

class FromDetailViewController: UIViewController {
    
    var postArray: [PostData] = []

    
    //データの一時的格納
    var minPrice:String = ""
    var maxPrice:String = ""
    var nearStation:String = ""
    
    
    @IBOutlet weak var firstBudgetLabel: UITextField!
    @IBOutlet weak var lastBudgetLabel: UITextField!
    @IBOutlet weak var stationLabel: UITextField!
    
    
    @IBAction func allMatchButton(sender: AnyObject) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewControllerWithIdentifier("NailSalon") as! NailSalonTableViewController
        
        //ラベルからの条件を格納
        self.minPrice = firstBudgetLabel.text!
        self.maxPrice = lastBudgetLabel.text!
        self.nearStation = stationLabel.text!

        nextView.minPrice = self.minPrice
        nextView.maxPrice = self.maxPrice
        nextView.nearStation = self.nearStation
        
        self.presentViewController(nextView, animated: true, completion: nil)
    }
    
    
    @IBAction func backButton(sender: AnyObject) {
        // 画面を閉じる
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
           
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkPriceRange(min:Int, MaxPrice:Int, Budget budget:Int) -> Bool {
        //価格範囲内ならTrue
        // 範囲外ならFalse
        
        if (min > budget){
        }
        if (MaxPrice < budget) {
        }
        return false
    }

    
    //segueから遷移先のNailSalonTableViewControllerを取得する
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nailSalonTableViewController:NailSalonTableViewController = segue.destinationViewController as! NailSalonTableViewController
        

        
        //resultViewController.name = self.name
        
        
    }
    
    //キーボードを閉じる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


    
    
}


