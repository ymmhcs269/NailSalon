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
    /*仮*/var id: String?
    var name: String?
    var budget: Int?
    var menu1: String?
    var menu2: String?
    var assessment: Int?
    var station: String?
    /*仮*/var imageString: String?
    var image: UIImage?

    init(snapshot: FIRDataSnapshot, myId: String) {
        id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
        imageString = valueDictionary["image"] as? String
        image = UIImage(data: NSData(base64EncodedString: imageString!, options: .IgnoreUnknownCharacters)!)
        
        name = valueDictionary["name"] as? String
        
        budget = valueDictionary["budget"] as? Int
     
        menu1 = valueDictionary["menu1"] as? String
     
        menu2 = valueDictionary["menu2"] as? String
     
        assessment = valueDictionary["assessment"] as? Int
     
        station = valueDictionary["station"] as? String
        
                }
    
        }
