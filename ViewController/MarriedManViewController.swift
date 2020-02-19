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
        
        // go back to the HomeViewController
           // updating the UI
             marriedManImage.image = #imageLiteral(resourceName: "HappyCouple")
             marriedManLabel.text = "You have a happy family!"
             yesKidButton.setTitle("Congratulation!", for: .normal)
             yesKidButton.isEnabled = false
             noKidButton.isHidden = true
        
        
    }
    
    @IBAction func noKidButtonTapped(_ sender: UIButton) {
        print("Just tapped no Kid Button ")
        // updating the UI
        marriedManImage.image = #imageLiteral(resourceName: "noKidCouple")
        marriedManLabel.text = "You should make babe in your free time!"
        yesKidButton.setTitle("Good luck!", for: .normal)
        yesKidButton.isEnabled = false
        noKidButton.isHidden = true
        
    }
    
}
