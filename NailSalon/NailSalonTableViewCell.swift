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
    
    var postData: PostData!
  

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    

    override func layoutSubviews() {
        nailImageView.image = postData.image
        stationLabel.text = "\(postData.station!)"
        budgetLabel.text = "\(postData.budget!)"
        
        
        
        super.layoutSubviews()
    }
        
    }

