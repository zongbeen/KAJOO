//
//  ShoppingCell.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/11/04.
//

import UIKit

class ShoppingCell: UITableViewCell {

    @IBOutlet var cart: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
