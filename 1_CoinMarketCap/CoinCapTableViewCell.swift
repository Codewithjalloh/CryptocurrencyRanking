//
//  CoinCapTableViewCell.swift
//  1_CoinMarketCap
//
//  Created by Jalloh on 06/02/2018.
//  Copyright © 2018 Jalloh. All rights reserved.
//

import UIKit

class CoinCapTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
