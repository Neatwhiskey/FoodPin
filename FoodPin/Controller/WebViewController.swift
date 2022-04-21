//
//  WebViewController.swift
//  FoodPin
//
//  Created by Neatwhiskey on 31/03/2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    
    var targetUrl = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: targetUrl){
            let request = URLRequest(url: url)
            webView.load(request)
        }

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
