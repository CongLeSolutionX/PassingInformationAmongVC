//
//  ViewController.swift
//  PassingInformation
//
//  Created by Cong Le on 1/26/20.
//  Copyright © 2020 EnhanceIT. All rights reserved.
//

import UIKit
//Notification - 1. Global notificaiton keys
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
    
    
    // Notification - 3
    let noSingle = Notification.Name(rawValue: noSingleNotificationKey)
    let yesSingle = Notification.Name(rawValue: yesSingleNotificationKey)
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
    //0). connect to new views via segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: sender)
        // open VC with corresponding identifiers
        if segue.identifier == "maleSingleSegue" {
            let singleVC = segue.destination as! SingleManViewController
            
            programmaticlyGetMsg(getMsg: singleVC.message) // for debug purposes
            
        }
    }
    
    // Notification -4 ).
    func createObservers() {
        // noSingle Observer
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainImage(notification:)), name: noSingle, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainLabel(notification:)), name: noSingle, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainButton(notification:)), name: noSingle, object: nil)
        
        // yesSingle Observer
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainImage(notification:)), name: yesSingle, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainLabel(notification:)), name: yesSingle, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainButton(notification:)), name: yesSingle, object: nil)
        
        // noKid Observer
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainImage(notification:)), name: noKid, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainLabel(notification:)), name: noKid, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainButton(notification:)), name: noKid, object: nil)
        
        // yesKid Observer
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainImage(notification:)), name: yesKid, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainLabel(notification:)), name: yesKid, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateMainButton(notification:)), name: yesKid, object: nil)
        
        
        
        
    }
    // Notification - 5 ).
    @objc func updateMainImage(notification: NSNotification){
        let isYesSingle = notification.name == yesSingle
        let isNoKid = notification.name == noKid
        
        if(isYesSingle){
            let imageFromYesSingle =  UIImage.safelyUnwrapImage("maleIcon")
            mainLogoImage.image = imageFromYesSingle
        } else {return }
        
        if(isNoKid){
            let imageFromNoKid = UIImage.safelyUnwrapImage("femaleIcon")
            mainLogoImage.image = imageFromNoKid
        } else {return }
        
        // if isYesSingle then unwrap first image, else unwrap second image
        //        let imageFromYesSingle = isYesSingle ? UIImage.safelyUnwrapImage("maleIcon") : UIImage.safelyUnwrapImage("maleIcon")
        //        let imageFromNoKid = isNoKid ? UIImage.safelyUnwrapImage("femaleIcon") : UIImage.safelyUnwrapImage("femaleIcon")
        
        
    }
    //Notification - 5).
    @objc func updateMainLabel(notification: NSNotification){
        let isYesSingle = notification.name == yesSingle
        let isNoKid = notification.name == noKid
        
        // YesSingle case
        if(isYesSingle){
            let labelFromYesSingle = "Enjoy your life when your are still Single"
            mainLabel.text = labelFromYesSingle
            
        } else {return}
        
        // noKid case
        if(isNoKid){
            let labelFromNoKid = "You should make some baby in your free time"
            mainLabel.text = labelFromNoKid
        } else {return }
        
        //let labelFromYesSingle = isYesSingle ?  "Enjoy your life when your are still Single" : "You must be married!"
        // let labelFromNoKid = isNoKid ? "You should make some baby in your free time" : "You have a busy schedule with family!"
        
        // updateing the mainLabel
       // mainLabel.isHidden = false
        
        
        
        
    }
    // Notification - 5).
    @objc func updateMainButton(notification: NSNotification){
        let isYesSingle = notification.name == yesSingle
        let isNoKid = notification.name == noKid
        
        //  let newColor = isYesSingle ? UIColor.systemRed : UIColor.systemYellow
        
        // Yes Single case
        if(isYesSingle){
            let newColorYesSingle = UIColor.systemRed
            view.backgroundColor = newColorYesSingle // change color of VC background
            
            // Updating the main button
            maleButton.backgroundColor = .orange
            maleButton.layer.cornerRadius = 15
            maleButton.setTitle("Good luck!", for: .normal)
            
            // terminatetion point of the story
                  femaleButton.isHidden = true
                  maleButton.isEnabled = false
        } else {return}
        
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


//4). conform to protocol, updating the elements
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

// adding safely unwrap method for class UIImage
extension UIImage {
    static func safelyUnwrapImage(_ checkingImage: String) -> UIImage {
        if let safeImage = UIImage(named: checkingImage){
            return safeImage
        } else {
            fatalError("Could not initialized \(UIImage.self) named \(checkingImage)")
        }
    }
}
