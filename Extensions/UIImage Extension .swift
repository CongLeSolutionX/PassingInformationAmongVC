//
//  UIImage Extension .swift
//  PassingInformation
//
//  Created by Consultant on 2/14/20.
//  Copyright © 2020 EnhanceIT. All rights reserved.
//

import UIKit

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
