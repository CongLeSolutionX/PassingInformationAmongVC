//
//  FemaleViewController.swift
//  PassingInformation
//
//  Created by Cong Le on 1/26/20.
//  Copyright © 2020 EnhanceIT. All rights reserved.
//

import UIKit
// Applying delegation Approach
// declare protocol and conform with class
protocol Instructions: class {
    func passInfo(messagePassed: String, imagePassed: UIImage, colorPassed: UIColor)
}




class FemaleViewController: UIViewController {
    
    //MARK: IBOutlets
    
    
    @IBOutlet weak var femaleIconImage: UIImageView!
    
    @IBOutlet weak var goBackMainButton: UIButton!
    
    //MARK: IBAction
    
    
    //MARK: Properties
    // Implicit unwrap optional 
    var message: String! = "connected to teamVC programmatically"
    
    
    //2). weak delegate to avoid retain cycles
    weak var femaleWorker: Instructions?
    
    //MARK: VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    //MARK: IBAction
    
    @IBAction func goBackMainButtonTapped(_ sender: Any) {
        print("You hit me man!")
        // creating new information and passing back to the main VC using protocol
        femaleWorker?.passInfo(messagePassed: "Only support for male for now", imagePassed: UIImage(named: "maleIcon")! , colorPassed: .systemGray)
        dismiss(animated: true)
    }

    
}
