//
//  Playground1ViewController.swift
//  recycle-hero-app
//
//  Created by Daniel Santoso on 08/04/21.
//

import UIKit

class Playground1ViewController: UIViewController {
    
    var counter = 0
    var item_list = ["mango","apple"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if counter == 0{
            print(item_list[0])
        }
        else{
            print("counter is 1")
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
