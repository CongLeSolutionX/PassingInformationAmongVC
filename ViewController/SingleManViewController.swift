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
    //2). weak delegate to avoid retain cycles
    weak var singleManWorker: Instructions?
    
    
    
    
    //MARK: VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: IBAction
    
    @IBAction func yesSingleButtonTapped(_ sender: UIButton) {
        print("just tapped yes single button ")
        let notifyName = Notification.Name(yesSingleNotificationKey)
        
        //Notification - 2 - post the notification for the listeners
        NotificationCenter.default.post(name: notifyName, object: nil)
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func noSingleButtonTapped(_ sender: UIButton) {
        print("just tapped no single button")
        //dismiss(animated: true, completion: nil)
        
    }
    
    
    //MARK: Function
    // segue to connect to the next MarriedManViewController 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
          super.prepare(for: segue, sender: sender)
          // open VC with corresponding identifiers
          if segue.identifier == "noSingleSegue" {
              let marriedVC = segue.destination as! MarriedManViewController
              
              programmaticlyGetMsg(getMsg: marriedVC.message) // for debug purposes
             
          }
      }
}



