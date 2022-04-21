//
//  NavigationController.swift
//  FoodPin
//
//  Created by Neatwhiskey on 06/03/2022.
//

import UIKit

class NavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }

}
