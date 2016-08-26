//
//  FromDetailViewController.swift
//  NailSalon
//
//  Created by 佐藤まりの on H28/08/25.
//  Copyright © 平成28年 mycompany. All rights reserved.
//


import UIKit

class FromDetailViewController: UIViewController {
    
  
    @IBOutlet weak var firstBudgetLabel: UITextField!
    @IBOutlet weak var lastBudgetLabel: UITextField!
    @IBOutlet weak var stationLabel: UITextField!
    @IBOutlet weak var firstAssessmentLabel: UITextField!
    @IBOutlet weak var lastAssessmentLabel: UITextField!
    
    @IBAction func someMatchButton(sender: AnyObject) {
    }
    @IBAction func allMatchButton(sender: AnyObject) {
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
    
    
}


