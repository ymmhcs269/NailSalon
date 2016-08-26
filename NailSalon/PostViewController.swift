//
//  PostViewController.swift
//  NailSalon
//
//  Created by 佐藤まりの on H28/08/25.
//  Copyright © 平成28年 mycompany. All rights reserved.
//


import UIKit

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var salonNameTextField: UITextField!
    @IBOutlet weak var nailImageView: UIImageView!
    @IBOutlet weak var stationTextField: UITextField!
    @IBOutlet weak var menuTextField1: UITextField!
    @IBOutlet weak var menuTextField2: UITextField!
    @IBOutlet weak var budgetTextField: UITextField!
    //(仮)@IBOutlet weak var assessmentTextField: UITextField!
    
    @IBAction func picsInputButton(sender: AnyObject) {
        // ライブラリ（カメラロール）を指定してピッカーを開く
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(pickerController, animated: true, completion: nil)
        }
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
    
    
        // 写真を撮影/選択したときに呼ばれるメソッド
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if info[UIImagePickerControllerOriginalImage] != nil {
            // 撮影/選択された画像を取得する
            nailImageView = info[UIImagePickerControllerOriginalImage] as! UIImageView
            
            // ここでpresentViewControllerを呼び出しても表示されないためメソッドが終了してから呼ばれるようにする
            dispatch_async(dispatch_get_main_queue()) {
                
            }
        }
        
        // 閉じる
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //ここ今はよく分からないところ
    //let imageData = UIImageJPEGRepresentation(nailImageView.image!,0.5)


    
    
}


