//
//  PlantListTableViewCell.swift
//  My garden
//
//  Created by Ivan Nikitin on 15/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

class PlantListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var plantImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sortLabel: UILabel!
    @IBOutlet weak var dateOfPlantLabel: UILabel!
    @IBOutlet weak var harwestTimeLable: UILabel!
    @IBOutlet weak var squareOfPlantLable: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
