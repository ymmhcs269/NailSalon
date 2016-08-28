//
//  NailSalonTableViewCell.swift
//  NailSalon
//
//  Created by 佐藤まりの on H28/08/25.
//  Copyright © 平成28年 mycompany. All rights reserved.
//

import UIKit

class NailSalonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stationLabel: UILabel!
    @IBOutlet weak var nailImageView: UIImageView!
    @IBOutlet weak var budgetLabel: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    func setPostData(postData: PostData) {
        nailImageView.image = postData.image
        stationLabel.text = postData.station
        //ここが今のところ失敗
        //budgetLabel.text = postData.budget
        
        }
        
        
        
    }
    
}
