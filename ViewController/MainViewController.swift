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
let noKidNotificationKey = "com.CongLeSolutionX.noKid"
let yesKidNotificationKey = "com.CongLeSolutionX.yesKid"

class MainViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var mainLogoImage: UIImageView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var femaleButton: UIButton!
    
    @IBOutlet weak var maleButton: UIButton!
    
    
    //MARK: Properties
    var message: String! = "Back to the main VC"
    
    
    
    let noKid = Notification.Name(rawValue: noKidNotificationKey)
    let yesKid = Notification.Name(rawValue: yesKidNotificationKey)
    
    
    //MARK: VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
    }
    
    //MARK: IBAction
    // using delegate communication with programmatic transition
    @IBAction func femaleButtonTapped(_ sender: UIButton) {
        //0. Starting the Delegation
        // connect to new view programmatically 
        let femaleVC = storyboard?.instantiateViewController(identifier: "FemaleVC") as! FemaleViewController
        
        programmaticlyGetMsg(getMsg: femaleVC.message) // for debug purposes
        
        //5.) set delegate as self
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
    
    // Notification).
    func createObservers() {

        
        // noKid Observer
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainImage(notification:)), name: noKid, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainLabel(notification:)), name: noKid, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainButton(notification:)), name: noKid, object: nil)
        
        // yesKid Observer
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainImage(notification:)), name: yesKid, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainLabel(notification:)), name: yesKid, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainButton(notification:)), name: yesKid, object: nil)
        
        
        
        
    }
    // Notification ).
    @objc func updateMainImage(notification: NSNotification){
        let isNoKid = notification.name == noKid
        
        if(isNoKid){
            let imageFromNoKid = UIImage.safelyUnwrapImage("femaleIcon")
            mainLogoImage.image = imageFromNoKid
        } else {return }
        
    }
    //Notification - 5).
    @objc func updateMainLabel(notification: NSNotification){

        let isNoKid = notification.name == noKid

        // noKid case
        if(isNoKid){
            let labelFromNoKid = "You should make some baby in your free time"
            mainLabel.text = labelFromNoKid
        } else {return }
  
        
        
    }
    // Notification
    @objc func updateMainButton(notification: NSNotification){
    
        let isNoKid = notification.name == noKid
        
        //  let newColor = isYesSingle ? UIColor.systemRed : UIColor.systemYellow

        // No kid case
        if(isNoKid){
            let newColorNoKid = UIColor.systemPink
            view.backgroundColor = newColorNoKid // change color of VC background
            
            // updating the maleButton
            maleButton.backgroundColor = .black
            maleButton.layer.cornerRadius = 15
            maleButton.setTitle("Make some babe in free time!", for: .normal)
            // terminatetion point of the story
                  femaleButton.isHidden = true
                  maleButton.isEnabled = false
        } else {return}
        
        
      
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
