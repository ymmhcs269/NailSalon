//
//  PostData.swift
//  NailSalon
//
//  Created by 佐藤まりの on H28/08/26.
//  Copyright © 平成28年 mycompany. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PostData: NSObject {
    var id: String?
    var name: String?
    var budget: String?
    var menu1: String?
    var menu2: String?
    var assessment: String?
    var station: String?
    /*仮*/var imageString: String?
    var image: UIImage?

    init(snapshot: FIRDataSnapshot, myId: String) {
        id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
        imageString = valueDictionary["image"] as? String
        image = UIImage(data: NSData(base64EncodedString: imageString!, options: .IgnoreUnknownCharacters)!)
        
        name = valueDictionary["name"] as? String
        
        budget = valueDictionary["budget"] as? String
     
        menu1 = valueDictionary["menu1"] as? String
     
        menu2 = valueDictionary["menu2"] as? String
     
        assessment = valueDictionary["assessment"] as? String
     
        station = valueDictionary["station"] as? String
        
                }
    
        }
