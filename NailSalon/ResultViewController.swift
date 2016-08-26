//
//  ResultViewController.swift
//  NailSalon
//
//  Created by 佐藤まりの on H28/08/25.
//  Copyright © 平成28年 mycompany. All rights reserved.
//


import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var nailImageView: UIImageView!
    @IBOutlet weak var stationLabel: UILabel!
    @IBOutlet weak var menuLabel1: UILabel!
    @IBOutlet weak var menuLabel2: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var assessmentLabel: UILabel!
    
    @IBAction func backButton(sender: AnyObject) {
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


