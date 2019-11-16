//
//  File.swift
//  Field Survey
//
//  Created by Yongyu Deng on 11/16/19.
//  Copyright © 2019 Yongyu Deng. All rights reserved.
//

import UIKit

enum Classification: String{
    case reptile
    case plant
    case mammal
    case insect
    case fish
    case bird
    case amphibian
    
    var image: UIImage?{
        return UIImage(named: self.rawValue + "Icon")
    }
}
