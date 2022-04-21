//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by Neatwhiskey on 06/03/2022.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    //MARK: - outlets declarations
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.adjustsFontForContentSizeCategory = true
            nameLabel.numberOfLines = 0
        }
    }
    @IBOutlet var locationLabel: UILabel! {
        didSet {
            locationLabel.adjustsFontForContentSizeCategory = true
            locationLabel.numberOfLines = 0
        }
    }
    @IBOutlet var typeLabel: UILabel! {
        didSet {
            typeLabel.adjustsFontForContentSizeCategory = true
            typeLabel.numberOfLines = 0
        }
    }
    @IBOutlet var thumbnailImageView: UIImageView! {
        didSet {
            thumbnailImageView.layer.cornerRadius = 20.0
            thumbnailImageView.clipsToBounds = true
        }
    }
    @IBOutlet var favoriteImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.tintColor = .systemYellow
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
