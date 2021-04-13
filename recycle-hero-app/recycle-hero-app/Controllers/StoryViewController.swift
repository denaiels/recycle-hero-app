//
//  StoryViewController.swift
//  recycle-hero-app
//
//  Created by Daniel Santoso on 13/04/21.
//

import UIKit

class StoryViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextButton: UIButton! {
        didSet {
            nextButton.layer.masksToBounds = true
        }
    }
    @IBOutlet var skipButton: UIButton
    
    
    override func viewDidLoad() {
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
