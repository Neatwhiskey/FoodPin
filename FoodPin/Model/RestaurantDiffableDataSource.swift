//
//  RestaurantDiffableDataSource.swift
//  FoodPin
//
//  Created by Neatwhiskey on 06/03/2022.
//

import UIKit

enum Section {
    case all
}

class RestaurantDiffableDataSource: UITableViewDiffableDataSource<Section, Restaurant> {

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

}
