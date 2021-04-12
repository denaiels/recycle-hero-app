//
//  SlideLeftViewController.swift
//  recycle-hero-app
//
//  Created by Daniel Santoso on 09/04/21.
//

import UIKit

class SlideLeftViewController: UIViewController {

    open func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, pushing: Bool, completion: (() -> Void)? = nil) {
        
        if pushing {
            
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            view.window?.layer.add(transition, forKey: kCATransition)
            viewControllerToPresent.modalPresentationStyle = .fullScreen
            self.present(viewControllerToPresent, animated: false, completion: completion)
            
        } else {
            self.present(viewControllerToPresent, animated: flag, completion: completion)
        }
        
    }

}
