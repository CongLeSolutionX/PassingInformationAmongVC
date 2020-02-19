//
//  SingleManViewController.swift
//  PassingInformation
//
//  Created by Cong Le on 1/26/20.
//  Copyright © 2020 EnhanceIT. All rights reserved.
//

import UIKit

class SingleManViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var singleManImage: UIImageView!
    
    @IBOutlet weak var singleManLabel: UILabel!
    
    @IBOutlet weak var yesSingleButton: UIButton!
    
    @IBOutlet weak var noSingleButton: UIButton!
    
    
    //MARK: Properties
    var message: String! = "connected singleMan VC via segue"
    // weak delegate to avoid retain cycles
    weak var singleManWorker: Instructions?
    
    // Notification Names
    let noSingle = Notification.Name(rawValue: noSingleNotificationKey)
    let yesSingle = Notification.Name(rawValue: yesSingleNotificationKey)
    
    
    //MARK: VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
        
    }
    
    
    //MARK: IBAction
    
    @IBAction func yesSingleButtonTapped(_ sender: UIButton) {
        print("just tapped yes single button ")
        let notifyName = Notification.Name(yesSingleNotificationKey)
        
        //Notification - 2 - post the notification for the listeners
        NotificationCenter.default.post(name: notifyName, object: nil)
    }
    
    @IBAction func noSingleButtonTapped(_ sender: UIButton) {
        print("just tapped no single button")
        let notifyName = Notification.Name(noSingleNotificationKey)
        
        //Notification - 2 - post the notification for the listeners
        NotificationCenter.default.post(name: notifyName, object: nil)
        
    }
    
    
    //MARK: Function
    // segue to connect to the next MarriedManViewController 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: sender)

          let marriedVC = segue.destination as! MarriedManViewController
        present(marriedVC,animated: true)
         programmaticlyGetMsg(getMsg: marriedVC.message) // for debug purposes
        
    }
    
    
    
    func createObservers() {
        // noSingle Observer
        NotificationCenter.default.addObserver(self, selector: #selector(SingleManViewController.goToNextVC(notification:)), name: noSingle, object: nil)
   
        // yesSingle Observer
        NotificationCenter.default.addObserver(self, selector: #selector(SingleManViewController.updateYesUI(notification:)), name: yesSingle, object: nil)
        
    }
    
    @objc func updateYesUI(notification: NSNotification){
        let isYesSingle = notification.name == yesSingle
        if(isYesSingle){
            // change the UI Image
            let imageFromYesSingle =  UIImage.safelyUnwrapImage("happySingle")
            singleManImage.image = imageFromYesSingle
            // change the UI Label
            singleManLabel.text = "Enjoy your life when your are still Single"
            
            // change the buttons and terminate the story flow
            let newColorYesSingle = UIColor.systemRed
            view.backgroundColor = newColorYesSingle // change color of VC background
            
            // Updating the main button
            yesSingleButton.backgroundColor = .orange
            yesSingleButton.layer.cornerRadius = 15
            yesSingleButton.setTitle("Good luck!", for: .normal)
            yesSingleButton.isEnabled = false
            
            // terminated point of the story flow
            noSingleButton.isHidden = true
            noSingleButton.isEnabled = false
        }
        else {
            return
        }
    }
    
    @objc func goToNextVC(notification: NSNotification){
        let isNoSingle = notification.name == noSingle
        if(isNoSingle){
            // continue the story flow and go to the MarriedManViewController
            let VC = storyboard?.instantiateViewController(identifier: "MarriedManVC") as! MarriedManViewController
            
            present(VC, animated: true, completion: nil)
        }
        
    }
}
