//
//  ViewController.swift
//  recycle-hero-app
//
//  Created by Daniel Santoso on 07/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello world")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "hasViewedStory"){
            return
        }
        
        let storyboard = UIStoryboard(name: "StoryPage", bundle: nil)
        if let storyViewController = storyboard.instantiateViewController(identifier: "StoryViewController") as? StoryViewController {
            present(storyViewController, animated: true, completion: nil)
        }
    }
    
}
