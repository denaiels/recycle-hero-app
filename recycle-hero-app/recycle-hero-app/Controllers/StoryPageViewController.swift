//
//  StoryPageViewController.swift
//  recycle-hero-app
//
//  Created by Daniel Santoso on 13/04/21.
//

import UIKit

class StoryPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var pageStories =
        ["A long time ago, the Earth was clean",
         "But, People keep on producing trash and throw them everywhere",
         "Now, The Earth is full of trash",
         "Mix and Match the Trash and Find Recycled Trash"]
    var pageImages =
        ["story1", "story2", "story3", "story4"]
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the data source to itself
        dataSource = self
        
        // Create first story screen
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController]?, direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! StoryPageContentViewController).index
        index -= 1
        
        return contentViewController(at: index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! StoryPageContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    // MARK: - Helper
    
    func contentViewController(at index: Int) -> StoryPageContentViewController? {
        if index < 0 || index >= pageStories.count {
            return nil
        }
        
        // Create new view controller and pass corresponding data
        let storyboard = UIStoryboard(name: "StoryPage", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(identifier: "StoryPageContentViewController") as? StoryPageContentViewController {
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.story = pageStories[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        
        return nil
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
