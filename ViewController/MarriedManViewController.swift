//
//  MarriedManViewController.swift
//  PassingInformation
//
//  Created by Cong Le on 1/26/20.
//  Copyright © 2020 EnhanceIT. All rights reserved.
//

//TODO: change the elements of the MainViewController using passed information
import UIKit

class MarriedManViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var marriedManImage: UIImageView!
    
    @IBOutlet weak var marriedManLabel: UILabel!
    
    @IBOutlet weak var yesKidButton: UIButton!
    
    
    @IBOutlet weak var noKidButton: UIButton!
    
    
    //MARK: Properties
    var message: String! = "connected marriedVC VC via segue"
    
    
    //MARK: VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: IBAction
    
    
    @IBAction func yesKidButtonTapped(_ sender: UIButton) {
        print("just tapped yes Kid Button ")
        
    }
    
    
    
    @IBAction func noKidButtonTapped(_ sender: UIButton) {
        print("Just tapped no Kid Button ")
         let notifyName = Notification.Name(noKidNotificationKey)
              
              //Notification - 2 - post the notification for the listeners
              NotificationCenter.default.post(name: notifyName, object: nil)
              let backToMainVC = storyboard?.instantiateViewController(identifier: "MainVC") as! MainViewController
                     
                present(backToMainVC, animated: true, completion: nil)
              //dismiss(animated: true, completion: nil)
    }
    
    
    
    //MARK: Function
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//
//        // passing information
//        if segue.identifier == "yesKidSegue" {
//            let backToMainVC = segue.destination as! MainViewController
//            present(backToMainVC, animated: true, completion: nil)
//            print("Im here ")
//        }
//    }
    
}
