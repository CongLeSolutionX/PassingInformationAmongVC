//
//  ViewController.swift
//  PassingInformation
//
//  Created by Cong Le on 1/26/20.
//  Copyright © 2020 EnhanceIT. All rights reserved.
//

import UIKit
//Global notificaiton keys
let noSingleNotificationKey = "com.CongLeSolutionX.noSingle"
let yesSingleNotificationKey = "com.CongLeSolutionX.yesSingle"

class MainViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var mainLogoImage: UIImageView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var femaleButton: UIButton!
    
    @IBOutlet weak var maleButton: UIButton!
    
    
    //MARK: Properties
    var message: String! = "Back to the main VC"
    
    
    //MARK: VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBAction
    // using delegate communication with programmatic transition
    @IBAction func femaleButtonTapped(_ sender: UIButton) {
        // connect to new view programmatically 
        let femaleVC = storyboard?.instantiateViewController(identifier: "FemaleVC") as! FemaleViewController
        
        programmaticlyGetMsg(getMsg: femaleVC.message) // for debug purposes
        
        //set delegate as self
        femaleVC.femaleWorker = self
        
        present(femaleVC, animated: true, completion: nil)
        
    }
    
    @IBAction func maleButtonTapped(_ sender: UIButton) {
        print("just tapped maleButton") // for debug purposes
        
        dismiss(animated: true, completion: nil)
        
    }
    //MARK:Functions
    // connect to new views via segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: sender)
        // open VC with corresponding identifiers
        if segue.identifier == "maleSingleSegue" {
            let singleVC = segue.destination as! SingleManViewController
            
            programmaticlyGetMsg(getMsg: singleVC.message) // for debug purposes
            
        }
    }
    
}

//MARK: Additional functionality

// conform to protocol, updating the elements
extension MainViewController: Instructions{
    func passInfo(messagePassed: String, imagePassed: UIImage, colorPassed: UIColor) {
        mainLogoImage.image = imagePassed
        mainLabel.text = messagePassed
        
        femaleButton.isHidden = true
        view.backgroundColor = colorPassed
    }
}

// safely unwrap via optional binding globally
func programmaticlyGetMsg(getMsg: String?){
    guard let receivedMsg = getMsg else {
        print("Failed to programatically received message")
        return  // exit the scope of the fucntion
    }
    print(receivedMsg)
}

