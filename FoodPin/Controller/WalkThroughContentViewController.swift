//
//  WalkThroughContentViewController.swift
//  FoodPin
//
//  Created by Neatwhiskey on 25/03/2022.
//

import UIKit

class WalkThroughContentViewController: UIViewController {

    //MARK: - outlets declarations
    @IBOutlet var headingLabel: UILabel!{
        didSet{
            headingLabel.numberOfLines = 0
        }
    }
    @IBOutlet var subheadingLabel: UILabel!{
        didSet{
            subheadingLabel.numberOfLines = 0
        }
    }
    @IBOutlet var contentImageView: UIImageView!
    
    var index = 0
    var heading = ""
    var subHeading = ""
    var imageFile = ""
    override func viewDidLoad() {
        headingLabel.text = heading
        subheadingLabel.text = subHeading
        contentImageView.image = UIImage(named: imageFile)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
