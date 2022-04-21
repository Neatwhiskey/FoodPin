//
//  WalkThroughPageViewController.swift
//  FoodPin
//
//  Created by Neatwhiskey on 25/03/2022.
//

import UIKit

protocol WalkthroughPageViewControllerDelegate: AnyObject{
    func didUpdatePageIndex(currentIndex: Int)
}

class WalkThroughPageViewController: UIPageViewController {
    
    var pageHeadings = ["CREATE YOUR OWN FOOD GUIDE", "SHOW YOU THE LOCATION", "DISCOVER GREAT RESTAURANTS"]
    var pageImages = ["onboarding-1", "onboarding-2", "onboarding-3"]
    var pageSubHeadings = ["Pin your favorite restaurants and create your own food guide",
                           "Search and locate your favourite restaurant on Maps",
                           "Find restaurants shared by your friends and other foodies"]
    
    var currentIndex = 0
    weak var walkthroughDelegate: WalkthroughPageViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        //set datasource to self
        delegate = self
        dataSource = self
        
        //create first walkthrough screen
        if let startingViewController = contentViewController(at: 0){
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }

        // Do any additional setup after loading the view.
    }
    
    
    

    
    // MARK: - Navigation

    func forwardPage(){
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex){
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    //}
    

}

extension WalkThroughPageViewController:UIPageViewControllerDataSource{
 
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkThroughContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkThroughContentViewController).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> WalkThroughContentViewController? {
        if index < 0 || index >= pageHeadings.count{
            return nil
        }
        
        //create a new view controller and pass suitable contents
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkThroughContentViewController") as? WalkThroughContentViewController{
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.subHeading = pageSubHeadings[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        return nil
    }
}
extension WalkThroughPageViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed{
            if let contentViewController = pageViewController.viewControllers?.first as? WalkThroughContentViewController{
                currentIndex = contentViewController.index
                walkthroughDelegate?.didUpdatePageIndex(currentIndex: contentViewController.index)
            }
        }
    }
}
