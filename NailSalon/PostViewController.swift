//
//  PostViewController.swift
//  NailSalon
//
//  Created by 佐藤まりの on H28/08/25.
//  Copyright © 平成28年 mycompany. All rights reserved.
//


import UIKit
import Firebase
import FirebaseDatabase


class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate {
    
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
    
    
    
    @IBAction func postButton(sender: AnyObject) {
        
         let postRef = FIRDatabase.database().reference().child(CommonConst.PostPATH)
        
        // ImageViewから画像を取得する
        let imageData = UIImageJPEGRepresentation(nailImageView.image!, 0.5)
        
        
        // 辞書を作成してFirebaseに保存する(評価はまだ入れていない)
         let postData = ["name": salonNameTextField.text!, "station": stationTextField.text!, "menu1": menuTextField1.text!,"menu2": menuTextField2.text!, "budget": budgetTextField.text!, "image": imageData!.base64EncodedStringWithOptions(.Encoding64CharacterLineLength),]
         postRef.childByAutoId().setValue(postData)
         
        /*let postData = ["caption": textField.text!, "image": imageData!.base64EncodedStringWithOptions(.Encoding64CharacterLineLength), "name": name, "time": time]
        postRef.childByAutoId().setValue(postData)*/
        
        
        // 全てのモーダルを閉じる
    UIApplication.sharedApplication().keyWindow?.rootViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    @IBAction func backButton(sender: AnyObject) {
        // 画面を閉じる
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //キーボードを閉じるための作業
        self.salonNameTextField.delegate = self
        self.stationTextField.delegate = self
        self.menuTextField1.delegate = self
        self.menuTextField2.delegate = self
        self.budgetTextField.delegate = self
        
    }
    
    //キーボードを閉じる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
        // 写真を撮影/選択したときに呼ばれるメソッド
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if info[UIImagePickerControllerOriginalImage] != nil {
            // 撮影/選択された画像を取得する
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            nailImageView.image = image
            
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


