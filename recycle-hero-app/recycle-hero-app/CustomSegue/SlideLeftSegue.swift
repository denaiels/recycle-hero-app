//
//  SlideLeftSegue.swift
//  recycle-hero-app
//
//  Created by Daniel Santoso on 09/04/21.
//

import UIKit

class SlideLeftSegue: UIStoryboardSegue {
    override func perform() {
        // Declare the INITAL view and the DESTINATION view
        // This will break and be nil if you don't have a second view controller for your DESTINATION view
        let initalView = self.source.view as UIView?
        let destinationView = self.destination.view as UIView?

        // Specify the screen HEIGHT and WIDTH
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width

        // Specify the INITIAL PLACEMENT of the DESTINATION view
        initalView?.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        destinationView?.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: screenHeight)

        // Access the app's key window and add the DESTINATION view ABOVE the INITAL view
        let appWindow = UIApplication.shared.keyWindow
        appWindow?.insertSubview(destinationView!, aboveSubview: initalView!)

//         Animate the segue's transition
        UIView.animate(withDuration: 0.4, animations: {
            // Left/Right
            initalView?.frame = (initalView?.frame.offsetBy(dx: -screenWidth, dy: 0))!
            destinationView?.frame = (destinationView?.frame.offsetBy(dx: -screenWidth, dy: 0))!
        }) { (Bool) in
            self.source.present(self.destination, animated: false, completion: nil)
        }
    }
//    override func perform() {
//        let src = self.source
//        let dst = self.destination
//
//        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
//        dst.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
//
//        UIView.animate(
//            withDuration: 0.4,
//            delay: 0.0,
//            options: .curveEaseInOut,
//            animations: {
//                dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
//            },
//            completion: { finished in
//                src.present(dst, animated: false, completion: nil)
//            }
//        )
//    }
    
}
