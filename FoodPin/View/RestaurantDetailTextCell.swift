//
//  RestaurantDetailTextCell.swift
//  FoodPin
//
//  Created by Neatwhiskey on 06/03/2022.
//

import UIKit

class RestaurantDetailTextCell: UITableViewCell {

    //MARK: - outlet declarations
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 0
            descriptionLabel.adjustsFontForContentSizeCategory = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
