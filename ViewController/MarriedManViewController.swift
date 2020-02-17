//
//  MarriedManViewController.swift
//  PassingInformation
//
//  Created by Cong Le on 1/26/20.
//  Copyright © 2020 EnhanceIT. All rights reserved.
//

import UIKit

class MarriedManViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var marriedManImage: UIImageView!
    
    @IBOutlet weak var marriedManLabel: UILabel!
    
    @IBOutlet weak var yesKidButton: UIButton!
    
    
    @IBOutlet weak var noKidButton: UIButton!
    
    
    //MARK: Properties
    var message: String! = "connected marriedVC via segue" // debug purposes 
    
    
    //MARK: VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: IBAction
    
    
    @IBAction func yesKidButtonTapped(_ sender: UIButton) {
        print("just tapped yes Kid Button ")
        let notifyName = Notification.Name(yesKidNotificationKey)
        
        //Notification - 2 - post the notification for the listeners
        NotificationCenter.default.post(name: notifyName, object: nil)
        
        // go back to the HomeViewController
        let mainVC = storyboard?.instantiateViewController(identifier: "MainVC") as! MainViewController
                      
        present(mainVC, animated: true, completion: nil)
    }
    
    
    
    @IBAction func noKidButtonTapped(_ sender: UIButton) {
        print("Just tapped no Kid Button ")
        let notifyName = Notification.Name(noKidNotificationKey)
        
        //Notification - 2 - post the notification for the listeners
        NotificationCenter.default.post(name: notifyName, object: nil)
        
         // go back to the HomeViewController
        let mainVC = storyboard?.instantiateViewController(identifier: "MainVC") as! MainViewController
         present(mainVC, animated: true, completion: nil)
    }
    
    
    
    //MARK: Function
  
}
