//
//  StoryContentViewController.swift
//  recycle-hero-app
//
//  Created by Daniel Santoso on 13/04/21.
//

import UIKit

class StoryContentViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet var storyLabel: UILabel! {
        didSet {
            storyLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var contentImageView: UIImageView!
    
    
    // MARK: - Properties
    
    var index = 0
    var story = ""
    var imageFile = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        storyLabel.text = story
        contentImageView.image = UIImage(named: imageFile)
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
