//
//  WalkThroughViewController.swift
//  FoodPin
//
//  Created by Neatwhiskey on 25/03/2022.
//

import UIKit

class WalkThroughViewController: UIViewController {
    //MARK: - variable declarations
    var walkThroughPageViewController: WalkThroughPageViewController?
    //MARK: - outlet declarations
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextButton:UIButton!{
        didSet{
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
    @IBOutlet var skipButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//MARK: - @IBActions
    @IBAction func skipButtonTapped(sender: UIButton){
        UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonTapped(sender: UIButton){
        if let index = walkThroughPageViewController?.currentIndex{
            switch index{
                case 0...1:
                    walkThroughPageViewController?.forwardPage()
                    
                case 2:
                    UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
                    dismiss(animated: true, completion: nil)
                    
                default: break
            }
        }
        updateUI()
    }
    
    func updateUI(){
        if let index = walkThroughPageViewController?.currentIndex{
            switch index{
                case 0...1:
                    nextButton.setTitle("NEXT", for: .normal)
                    skipButton.isHidden = false
                    
                case 2:
                    nextButton.setTitle("GET STARTED", for: .normal)
                    skipButton.isHidden = true
                    
                default: break
            }
            pageControl.currentPage = index
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkThroughPageViewController{
            walkThroughPageViewController = pageViewController
            walkThroughPageViewController?.walkthroughDelegate = self
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
extension WalkThroughViewController: WalkthroughPageViewControllerDelegate{
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
}
